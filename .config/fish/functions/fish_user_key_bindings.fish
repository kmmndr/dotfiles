function _fish_quit_shell
  if [ -z $DEVELOPPER_MODE ]
    exit
  end
end

function fish_user_key_bindings
  bind \cd _fish_quit_shell
end
