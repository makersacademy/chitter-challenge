module Redirections
  def notice_redir(notice: notice_arg, redirection: redir_arg)
    flash[:notice] = notice
    redirect(redirection)
  end
end
