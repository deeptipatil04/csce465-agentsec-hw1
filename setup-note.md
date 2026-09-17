# HW1 Setup Note

## Environment

I completed this assignment inside an Ubuntu 24.04 LTS x86-64 virtual machine running in UTM on an Apple Silicon Mac. The VM was configured using x86-64 emulation with 4 virtual CPUs, 8 GB of RAM, an 80 GB virtual disk, and Shared Network (NAT) networking. Shared folders were not used during the security experiments.

## Software Versions

- Ubuntu 24.04 LTS
- Architecture: x86_64
- Node.js: v24.18.0
- npm: 11.6.0
- OpenClaw: 2026.7.1-2
- Ollama: 0.34.1
- Local models downloaded: qwen3.5:2b and qwen3.5:4b

The exact version information is also recorded in `versions.txt`.

## OpenClaw and Model Setup

Node.js was installed using nvm. OpenClaw was installed using the version required for the assignment.

I initially configured and tested OpenClaw with a local Ollama model. The qwen3.5:4b model was successfully downloaded and a direct model test returned the expected response.

For later agent experiments, I used the provided TAMU API shim. The shim ran locally at:

`http://127.0.0.1:8899`

The OpenClaw Gateway ran on the VM loopback interface at:

`127.0.0.1:18789`

This kept the OpenClaw gateway inaccessible directly from outside the VM.

## Local Web Server

For the prompt-injection experiment, I created two local webpages:

- `web/benign.html`
- `web/adversarial.html`

They were served only on the loopback interface using:

`python3 -m http.server 8000 --directory web --bind 127.0.0.1`

The benign page contained only a fictional system status report. The adversarial page contained the same report plus an obvious untrusted instruction directed at the AI agent.

## Safe Marker

I created a harmless `safe-marker` skill for testing tool authorization. Its shell script accepts only the exact argument `course-marker`. Any other argument is rejected.

The only intended file operation is creating:

`~/csce465-agentsec/hw1/markers/marker.txt`

The script does not execute arbitrary user-supplied programs or commands.

## Safety Measures

All experiments were performed inside the isolated Ubuntu VM. The OpenClaw Gateway and test webpage server were bound to loopback addresses. I did not scan or attack external systems. The prompt-injection experiments used only fictional webpage content and a harmless marker file. No real secrets or credentials were intentionally included in the repository or experiment evidence.
