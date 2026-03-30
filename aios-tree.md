# AIOS Tree

I ask where a new project belongs
-> I trace the main operator-facing chain first
-> I separate transport, artifact, owner, and executor layer by layer
-> each day adds one harder boundary
-> the final comparison table grows out of that tree
-> next time a new project appears, I attach it to the right branch instead of mixing categories

```text
                                      AIOS TREE
                      how the layer map slowly grew into a real tree


                                                [ 2026-03-31 ]
                                             new leaf cluster appears
                                   "new project arrives: hermes-agent"
                                                      |
                                                      v
                                  .--------------------------------------.
                                 /   runtime-orchestration-control-plane   \
                                /            mapping becomes explicit       \
                               '--------------------------------------------'
                                 |                  |                  |
                                 |                  |                  |
                                 |                  |                  `=> Harness
                                 |                  |                      control plane / platform
                                 |                  |
                                 |                  `=> hermes-agent
                                 |                      runtime / product
                                 |
                                 `=> ClawTeam-OpenClaw
                                     worker-coordination shell

                                          ^
                                          |
                                          |
                                   grows from earlier trunk
                                          |
                                          |
             wrong path <-----------------+-----------------> right path
   "mix runtime, orchestration, provider, control plane"     "compare each thing only inside its own layer"


     [ 2026-03-29 ]                                                                  side branch
  mainline finally spoken out loud                                                    completion closure
             |                                                                                |
             v                                                                                v
    .-------------------------------.                                           .-----------------------------.
   / host Codex -> A2A -> OpenClaw  \                                         / truth -> latest -> wake ->  \
  / main agent -> 103 Codex          \                                       / processed summary             \
  '-----------------------------------'                                      '-------------------------------'
             |                                                                                |
             |                                                                                |
             |                                                                                `=> "result truth stays below
             |                                                                                     orchestration"
             |
             +--> OpenClaw main
             |      = orchestration owner
             |
             +--> 103 Codex
             |      = bounded executor
             |
             +--> agentapi
             |      = support-only
             |
             `--> SSH
                    = break-glass / repair


                     [ 2026-03-28 ]
              transport and artifact branches separate
                              |
                              v
                   .----------------------------------.
                  / workers should not choose ad hoc   \
                 / between repo sync / NFS / SMB / ... \
                 '--------------------------------------'
                         /                 |                 \
                        /                  |                  \
                       v                   v                   v
                  [ repo sync ]       [ NFS ]             [ SMB ]
                  tracked rules       machine-facing      human-facing
                  and workspace       default bus         export only
                                          |
                                          |
                                          `=> "not SMB as peer AI route"

                              \
                               \
                                `=> runtime-local evidence
                                    and continuity memory
                                    remain separate surfaces


             [ 2026-03-26 ]                    [ 2026-03-26 ]
       transport split starts              host/vm103 collaboration starts
                  |                                      |
                  v                                      v
      .---------------------------.          .--------------------------------.
     / NFS primary bus and SMB     \        / host supervisor + vm103 executor \
    / auxiliary side port appear    \      / collaboration starts to stabilize  \
    '-------------------------------'      '------------------------------------'
                  \                                      /
                   \                                    /
                    \                                  /
                     \                                /
                      \                              /
                       \                            /
                        \                          /
                         \                        /
                          \                      /
                           \                    /
                            \                  /
                             \                /
                              \              /
                               \            /
                                \          /
                                 \        /
                                  \      /
                                   \    /
                                    \  /
                                     \/
                              ==================
                              ||    ROOT      ||
                              || operator asks||
                              || "how should  ||
                              || host and     ||
                              || vm103 work?" ||
                              ==================


    root memory in plain words
    --------------------------
    not this:
      "one big mixed system where every path is a main path"

    but this:
      "one tree with different branch duties"


    root -> trunk -> branches -> leaves
    -----------------------------------
    root:
      I need host and vm103 to collaborate

    trunk:
      ownership and transport must separate

    branches:
      repo sync / NFS / SMB / A2A / runtime-local / support-only edges

    leaves:
      OpenClaw / ClawTeam-OpenClaw / hermes-agent / Harness each gets
      attached to the right layer instead of being mixed into one bucket
```

## Reuse Anchor

Not this:

- every new AI project is just another agent
- every transport path is just another mainline
- every platform-looking thing belongs in the same comparison bucket

But this:

- place it on the tree first
- then compare it only with neighbors on the same branch

## Timeline Anchor

- `2026-03-26`
  - transport split and host/vm103 collaboration begin to separate
- `2026-03-28`
  - artifact and routing boundaries become explicit
- `2026-03-29`
  - accepted mainline and owner/executor split become stable
- `2026-03-31`
  - the four-item layer map becomes explicit after adding `hermes-agent`
