function fish_title
  if [ -z $TERM_TITLE ]
    echo $_ ' '
    pwd
  else
    echo $TERM_TITLE
  end
end

function set_term_title -S
  if [ (count $argv) = 0 ]
    set -e TERM_TITLE
  else
    set -x TERM_TITLE $argv
  end
end
