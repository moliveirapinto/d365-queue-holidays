Set-Location "C:\Users\maoliveira\dev\d365-queue-holidays"
git add -A
git -c user.name="moliveirapinto" -c user.email="moliveirapinto@users.noreply.github.com" commit -q -m "v1.2.1: refresh screenshot and bump solution version for WFM copy"
git push -q origin main
$notes = @'
Copy and packaging update on top of v1.2.0.

- On-screen text now mentions Workforce Management alongside queues: the app subtitle, the holiday dialog subtitle, the "how it works" steps, the schedule hint, and the row Edit tooltip.
- The holidays table column is named "Applied To" since it lists both queues and WFM.
- README and screenshot refreshed.

No functional changes from v1.2.0.

**Install:** download QueueHolidaysManager_1_2_1_0.zip and import it via make.powerapps.com > Solutions > Import solution.
'@
$notes | Set-Content -Path "$env:TEMP\qh-notes.md" -Encoding UTF8
gh release create v1.2.1 "QueueHolidaysManager_1_2_1_0.zip" --title "v1.2.1 - WFM wording" --notes-file "$env:TEMP\qh-notes.md"
Remove-Item "$env:TEMP\qh-notes.md" -Force
