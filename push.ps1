Set-Location "C:\Users\maoliveira\dev\d365-queue-holidays"
git add -A
git -c user.name="moliveirapinto" -c user.email="moliveirapinto@users.noreply.github.com" commit -q -m "v1.4.0: Queue and WFM filters in list view and calendar"
git push -q origin main
git rev-parse HEAD
