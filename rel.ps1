Set-Location "C:\Users\maoliveira\dev\d365-queue-holidays"
git add -A
git -c user.name="moliveirapinto" -c user.email="moliveirapinto@users.noreply.github.com" commit -q -m "v1.2.2: split list view into separate Queues and WFM columns"
git push -q origin main
$notes = @'
List view now has separate **Queues** and **WFM** columns instead of one combined "Applied To" column, so you can see at a glance where each holiday is applied.

- Green chips = queues, blue chips = Workforce Management operating hours.
- Each column independently shows "Not applied" when nothing is linked, so a schedule applied to queues but not WFM (or vice versa) is obvious immediately.

No data or API changes from v1.2.1.

**Install:** download QueueHolidaysManager_1_2_2_0.zip and import it via make.powerapps.com > Solutions > Import solution.
'@
$notes | Set-Content -Path "$env:TEMP\qh-notes.md" -Encoding UTF8
gh release create v1.2.2 "QueueHolidaysManager_1_2_2_0.zip" --title "v1.2.2 - Separate Queues and WFM columns" --notes-file "$env:TEMP\qh-notes.md"
Remove-Item "$env:TEMP\qh-notes.md" -Force
