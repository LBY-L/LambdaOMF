function fish_prompt  
  set -l last_status $status

  # Setup colors
  set -l normal (set_color normal)
  set -l white (set_color FFFFFF)
  set -l turquoise (set_color 5fdfff)
  set -l orange (set_color df5f00)
  set -l hotpink (set_color df005f)
  set -l blue (set_color blue)
  set -l limegreen (set_color 87ff00)
  set -l purple (set_color af5fff)

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color 5fdfff
  set -g __fish_git_prompt_color_flags df5f00
  set -g __fish_git_prompt_color_prefix white
  set -g __fish_git_prompt_color_suffix white
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true
  set -g __fish_prompt_char 'λ'

  ## Line 1
  set -l user (whoami)
  set -l root ""

  if test $last_status -ne 0
    set __fish_prompt_char $hotpink'λ'$normal
  end

  if test $user = "root"
    set root "# "
  end

  echo -n $limegreen(prompt_pwd|sed "s=$HOME=~=")$turquoise
  __fish_git_prompt " · %s"
  echo

  ## Line 2
  echo -n $root$orange$__fish_prompt_char' '$normal
end
