# Daylight: Daily Routine Tracker

A small daily routine tracker (plain HTML/CSS/JS, no build step) with a Terraform configuration that is linked to
HCP Terraform through GitHub.

## Structure
| Path | What it is |
|---|---|
| `app/index.html` | The tracker. Open it in a browser. Data is saved in the browser's local storage. |
| `terraform/` | Terraform config run by HCP Terraform (random provider only, no cloud credentials). |

## Link it to HCP Terraform (VCS-driven workflow)
1. Push this repo to GitHub.
2. In HCP Terraform: **Workspaces > New > Version Control Workflow**, connect GitHub, choose this repo.
3. In the workspace **Settings > General**, set **Terraform Working Directory** to `terraform`.
4. In **Settings > Version Control**, set automatic run triggering to **Only trigger runs when files in specified paths change** and add `/app/**/*` so app changes also trigger a run.
5. Click **Start new run**, review the plan, and apply.

## Try it
- Edit a line in `app/index.html`, commit, and watch a new run start. The release name and hash output change.
- Set the workspace variable `environment` to `staging` and see the validation error.
- Open the state versions and run history in the workspace.

## Next step
Add real hosting (for example a Google Cloud Storage static site) as a new Terraform resource, using credentials stored as sensitive workspace variables, never in the repo.
