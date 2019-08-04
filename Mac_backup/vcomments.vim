"https://stackoverflow.com/questions/52961130/how-to-insert-character-before-match-pattern-using-vim-or-sed
function! Comment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py'
    silent s/\S/\# &/
"    silent s/^/\#/
  elseif ext == 'js' || ext == 'java' || ext == 'c' || ext == 'cpp'
    silent s/\S/\/\/ &/
"    silent s:^:\/\/:g
  elseif ext == 'vim'
    silent s:^:\":g
  endif
endfunction

function! Uncomment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py'
    silent s/\# //1
"    silent s/^\#//
  elseif ext == 'js' || ext == 'java' || ext == 'c' || ext == 'cpp'
    silent s/\/\/ //1
"    silent s:^\/\/::g
  elseif ext == 'vim'
    silent s:^\"::g
  endif
endfunction
