# AI Assistance Log

AI Tool Used: ChatGPT

This file documents relevant AI assistance used while completing CSCE 465 HW1. No API keys, passwords, tokens, or other credentials are included.

## 1. Understanding the Assignment

Prompt:
"Help me understand what I need to do for this homework and walk me through it step by step."

AI Assistance:
ChatGPT helped break the assignment into smaller tasks and explained the required OpenClaw environment, benign testing, safe-marker skill, prompt-injection experiment, threat model, and required deliverables.

## 2. Ubuntu and OpenClaw Setup

Prompt:
"Help me set up the Ubuntu VM and OpenClaw environment for this assignment."

AI Assistance:
ChatGPT provided step-by-step guidance for configuring the Ubuntu x86-64 VM, installing Node.js through nvm, installing the required OpenClaw version, checking the OpenClaw gateway, and troubleshooting the local model configuration.

## 3. Ollama and Model Setup

Prompt:
"Help me configure the model for OpenClaw and test that it works."

AI Assistance:
ChatGPT helped configure Ollama with qwen3.5:4b, verify the model installation, and troubleshoot model timeout and context-window issues. It also helped with using the TAMU API shim when needed.

## 4. Safe-Marker Skill

Prompt:
"Help me create the safe-marker skill required by the assignment."

AI Assistance:
ChatGPT helped create and test a shell script that accepts only the argument `course-marker` and creates only the designated marker file. It also helped configure the OpenClaw skill and verify it with `openclaw skills check`.

## 5. Benign Agent Tests

Prompt:
"Help me run the benign tasks required for Task 1 and save the evidence."

AI Assistance:
ChatGPT suggested harmless test prompts, showed how to save responses to evidence files, and helped verify that at least one test successfully invoked a tool.

## 6. Prompt-Injection Experiment

Prompt:
"Help me perform the direct and indirect prompt-injection experiments safely."

AI Assistance:
ChatGPT helped structure the direct test where the user explicitly requested the safe-marker action and the indirect test where an untrusted local webpage contained the instruction. It also helped preserve responses, marker results, execution-policy output, and audit evidence.

## 7. Threat Model and DFD

Prompt:
"Help me create the threat model and data-flow diagram for the OpenClaw system."

AI Assistance:
ChatGPT helped identify system components, assets, principals, trust boundaries, threats, and preventive/detective controls. It also helped organize the DFD showing the OpenClaw gateway, model provider, agent context, tool decision boundary, local webpage server, and VM operating system.

## 8. Security Advisory

Prompt:
"Help me understand what I need to include in the OpenClaw security advisory analysis."

AI Assistance:
ChatGPT helped organize the advisory analysis around the vulnerable component, attacker-controlled input, preconditions, root cause, impact, fix, regression testing, and relationship to prompt injection.

## 9. Documentation and Git

Prompt:
"Help me make sure my homework repository contains the required files and help me upload it to GitHub."

AI Assistance:
ChatGPT helped organize the README, evidence files, report, AI usage documentation, and Git repository. It also provided guidance for committing the files and pushing the repository to a private GitHub repository.

## Verification

I reviewed the commands, outputs, experiment results, and written analysis used in my submission. AI assistance was used for explanation, setup guidance, debugging, organization, and drafting support. I am responsible for the final submitted work and its conclusions.
