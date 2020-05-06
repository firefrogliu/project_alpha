/\\begin{table\*}/,/\\end{table\*}/ {
  s/\\begin{table\*}[ tab]*\(\[.*\]\)\?/\\begin{table*}[p]/
  /\\caption/d
  s/\\end{table\*}/\\end{table*}/
  /\\end{table\*}/a\
	\\clearpage
  /^$/d
  p 
}
/\\begin{table}/,/\\end{table}/ {
  s/\\begin{table}[ tab]*\(\[.*\]\)\?/\\begin{table}[p]/
  /\\caption/d
  s/\\end{table}/\\end{table}/
  /\\end{table}/a\
	\\clearpage
  /^$/d
  p 
}
