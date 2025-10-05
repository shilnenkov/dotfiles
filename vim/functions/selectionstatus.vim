" --- Selection status: adds Shift+V indicator for Visual-Line mode ---
function SelectionStatus()
  if mode() !~? '[v\x16]'
    return ''
  endif

  let [l1, c1] = getpos('v')[1:2]
  let [l2, c2] = getpos('.')[1:2]
  let lines = abs(l2 - l1) + 1

  " Visual-block mode
  if mode() ==# "\x16"
    let w = abs(virtcol('.') - virtcol('v')) + 1
    return printf('  [%d lines × %d cols]', lines, w)
  endif

  " Visual-line (Shift+V) mode
  if mode() ==# 'V'
    return printf('  [%d lines]', lines)
  endif

  " Multi-line but still charwise (v ... moves across lines)
  if lines > 1
    return printf('  [%d lines]', lines)
  endif

  " Single line, charwise visual selection
  let chars = abs(c2 - c1) + 1
  return printf('  [%d chars]', chars)
endfunction

