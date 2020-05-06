/\\begin{figure\*}/,/\\end{figure\*}/ {
  s/\\begin{figure\*}[ tab]*\(\[.*\]\)\?/\\begin{figure*}[p]/
  /\\caption/d
  s/\\end{figure\*}/\\end{figure*}/
  /\\end{figure\*}/a\
	\\clearpage
  /^$/d
  p 
}
/\\begin{figure}/,/\\end{figure}/ {
  s/\\begin{figure}[ tab]*\(\[.*\]\)\?/\\begin{figure}[p]/
  /\\caption/d
  s/\\end{figure}/\\end{figure}/
  /\\end{figure}/a\
	\\clearpage
  /^$/d
  p 
}
