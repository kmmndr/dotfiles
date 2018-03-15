setenv SSH_ENV $HOME/.ssh/environment

function __ssh_env_load
  if [ -f $SSH_ENV ]
    echo "Loading ssh env..."
    . $SSH_ENV > /dev/null
  end
end

function ssh-agent_start
  __ssh_env_load

  if [ -n "$SSH_AGENT_PID" ]
    ps -p $SSH_AGENT_PID > /dev/null; or set -u SSH_AGENT_PID
  end

  if [ ! -n "$SSH_AGENT_PID" ]
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV
    source $SSH_ENV > /dev/null
  end
end

function ssh-agent_stop
  if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
      echo "Quitting SSH agent ..."
      ssh-add -D
      ssh-agent -k > /dev/null 2>&1
      set -e SSH_AGENT_PID
      set -e SSH_AUTH_SOCK
      echo '' > $SSH_ENV
    end
  end
end
