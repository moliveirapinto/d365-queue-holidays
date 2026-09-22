Set-Location "C:\Users\maoliveira\dev\d365-queue-holidays"
git add -A
git -c user.name="moliveirapinto" -c user.email="moliveirapinto@users.noreply.github.com" commit -q -m "v1.3.0: add calendar view"
git push -q origin main
$notes = @'
New **Calendar view**.

Click **Calendar** in the toolbar to open a month grid of your holidays instead of reading them as table rows.

- Month navigation with prev/next, a **Today** button, and left/right arrow keys.
- Holidays render as colour-coded pills, one colour per holiday schedule, with a legend when more than one schedule is in play.
- Today is circled, weekends and adjacent-month days are shaded differently, and days with holidays are highlighted.
- A per-month holiday count, and cells with many holidays collapse to "+N more".
- Click any holiday pill to jump straight into editing it.
- Opens on the current month, or the first month that actually contains holidays if the current one is empty.
- Escape closes, and clicking the backdrop closes.

**Install:** download QueueHolidaysManager_1_3_0_0.zip and import it via make.powerapps.com > Solutions > Import solution.
'@
$notes | Set-Content -Path "$env:TEMP\qh-notes.md" -Encoding UTF8
gh release create v1.3.0 "QueueHolidaysManager_1_3_0_0.zip" --title "v1.3.0 - Calendar view" --notes-file "$env:TEMP\qh-notes.md"
Remove-Item "$env:TEMP\qh-notes.md" -Force
