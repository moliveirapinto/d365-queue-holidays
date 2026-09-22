Set-Location "C:\Users\maoliveira\dev\d365-queue-holidays"
git add -A
git -c user.name="moliveirapinto" -c user.email="moliveirapinto@users.noreply.github.com" commit -q -m "v1.5.0: editorial UI redesign"
git push -q origin main
$notes = @'
Complete visual redesign. Same features, substantially better craft.

**Direction** — an "editorial almanac" look: warm paper background, serif display type, ink-black primary actions, and a single burnt-sienna accent instead of the old blue/teal gradient.

**What changed**

- **Masthead** replaces the gradient banner: serif wordmark with the Total / Visible / Schedules figures set as a bordered stat group in the same serif, using tabular numerals.
- **Tabs** are now underline tabs with an accent rule on the active tab, instead of filled pills.
- **Table** is far lighter: hairline row rules, uppercase micro-cap headers with letterspacing, row hover, tabular-numeral dates, and no more wrapping of dates or row actions.
- **Chips** are calmer: a small colour dot plus low-chroma fill. "Not applied" is now a dashed, italic, muted chip so unassigned rows read as absence rather than as a warning.
- **Buttons**: primary is ink-black, secondary is a hairline outline, destructive is a soft clay red. All have focus-visible rings and a subtle press state.
- **Modals** lose the gradient headers for a clean white head with a serif title, softer large shadow, and a backdrop blur.
- **Calendar** is the showpiece: serif month title, quieter grid, today marked with a filled accent circle, and holiday pills carrying a coloured left bar per schedule.
- **Motion**: card rise-in on load, modal scale-in, and short transitions throughout — all disabled under `prefers-reduced-motion`.

**Still zero external dependencies.** Typography uses Georgia and Segoe UI, both already present on Windows, so nothing is fetched from a CDN and the app stays safe in locked-down environments.

**Install:** download QueueHolidaysManager_1_5_0_0.zip and import it via make.powerapps.com > Solutions > Import solution.
'@
$notes | Set-Content -Path "$env:TEMP\qh-notes.md" -Encoding UTF8
gh release create v1.5.0 "QueueHolidaysManager_1_5_0_0.zip" --title "v1.5.0 - Redesigned interface" --notes-file "$env:TEMP\qh-notes.md"
Remove-Item "$env:TEMP\qh-notes.md" -Force
