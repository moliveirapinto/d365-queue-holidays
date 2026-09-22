Set-Location "C:\Users\maoliveira\dev\d365-queue-holidays"
git add -A
git -c user.name="moliveirapinto" -c user.email="moliveirapinto@users.noreply.github.com" commit -q -m "docs: better screenshots - full-width, no scrollbars, complete views"
git push -q origin main
git log --oneline -1
git status --short
Get-ChildItem -Filter *.png | ForEach-Object { "{0,-28} {1,8} bytes" -f $_.Name, $_.Length }
