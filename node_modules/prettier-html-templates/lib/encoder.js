const encodeExpressions = (tokens) => {
  const expressionMap = new Map();
  // TODO: betterNames
  const open = [];
  const conds = [];
  let id = 0;
  let lastId = 0;
  let firstCond = false;

  const textWithPlaceholders = tokens
    .map((token) => {
      const {
        type,
        subType,
        content,
        inElement,
        afterInlineEndTag,
        inScript,
        inComment,
        afterWhitespace,
        inElementWithoutNeedToEncode,
      } = token;

      if (inComment || inElementWithoutNeedToEncode) {
        return content;
      }

      switch (type) {
        case 'text':
          return content;

        case 'start': {
          id++;
          open.push(id);

          if (subType === 'nested') {
            conds.push(id);
            firstCond = false;
          }

          if (inElement) {
            expressionMap.set(`eexa${id}`, { print: content, ...token });

            return ` eexa${id} `;
          }

          expressionMap.set(`<eext${id}>`, { print: content, ...token });

          const addNewLineBefore = afterWhitespace ? '' : '\n';
          return `${addNewLineBefore}<eext${id}>\n`;
        }
        case 'plain': {
          id++;

          if (inScript) {
            expressionMap.set(`eexs${id}eexs`, { print: content, ...token });

            return `eexs${id}eexs`;
          }

          if (inElement) {
            expressionMap.set(`eex${id}eex`, { print: content, ...token });

            return `eex${id}eex`;
          }

          expressionMap.set(`<eext${id}`, { print: content, ...token });

          const addBeforeSpace = afterInlineEndTag ? '' : ' ';

          return `${addBeforeSpace}<eext${id} /> `;
        }
        case 'middle':
          lastId = open.pop();
          id++;
          open.push(id);

          if (inElement) {
            expressionMap.set(`eexc${lastId}`, { print: '', ...token });
            expressionMap.set(`eexa${id}`, { print: content, ...token });

            return ` eexc${lastId} eexa${id} `;
          }

          expressionMap.set(`</eext${lastId}>`, { print: '', isMidExpression: true, ...token });
          expressionMap.set(`<eext${id}>`, { print: content, isMidExpression: true, ...token });

          return `\n</eext${lastId}> <eext${id}> `;

        case 'middle_nested':
          if (!firstCond) {
            firstCond = true;
            id++;
            open.push(id);
            expressionMap.set(`<eext${id}>`, { print: content, ...token });

            return `<eext${id}>\n`;
          } else {
            lastId = open.pop();
            id++;
            open.push(id);

            expressionMap.set(`</eext${lastId}>`, { print: '', isMidExpression: true, type: type });
            expressionMap.set(`<eext${id}>`, { print: content, isMidExpression: true, type: type });

            return `\n</eext${lastId}> <eext${id}>`;
          }

        case 'end':
          lastId = open.pop();

          if (open.length && conds.length && conds.includes(open[open.length - 1])) {
            const condEnd = open.pop();

            expressionMap.set(`</eext${lastId}>`, { print: '', ...token });
            expressionMap.set(`</eext${condEnd}>`, { print: content, ...token });

            return `</eext${lastId}> </eext${condEnd}>`;
          }

          if (inElement) {
            expressionMap.set(`eexc${lastId}`, { print: content, ...token });

            return ` eexc${lastId} `;
          }

          expressionMap.set(`</eext${lastId}>`, { print: content, ...token });

          return ` </eext${lastId}>`;
      }
    })
    .join('');

  if (open.length > 0) {
    // TODO: better error message - show which one isn't closed
    throw 'Missing closing expression';
  }

  return [textWithPlaceholders, expressionMap];
};

module.exports = encodeExpressions;
