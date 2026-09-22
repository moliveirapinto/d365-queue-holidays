param([string]$Sha)
$app = "C:\Users\maoliveira\dev\d365-queue-holidays\solution\WebResources\qhol_queue_holidays_app.html"
Set-Location "C:\Users\maoliveira\dev\d365-queue-holidays"
git add -A
git -c user.name="moliveirapinto" -c user.email="moliveirapinto@users.noreply.github.com" commit -q -m "UI polish"
git push -q origin main
git rev-parse HEAD
