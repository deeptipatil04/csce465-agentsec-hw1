# Task 4 - Threat Model

## System Overview

The system consists of an OpenClaw AI agent running inside an Ubuntu 24.04 x86-64 virtual machine. The user communicates with the OpenClaw agent, which sends prompts and context to the configured model provider. The agent can interpret model responses, select skills or tools, and potentially perform actions on the VM. The experiment also includes a local HTTP server that provides benign and adversarial webpage content.

## Assets

1. User instructions and agent conversation context
2. Files and data stored inside the Ubuntu VM
3. Tool and skill execution privileges
4. API credentials and OpenClaw configuration
5. Audit logs and experiment evidence

## Principals

1. User - provides trusted requests and decides what the agent should do.
2. OpenClaw Agent - processes requests and proposes tool or skill actions.
3. External Content Provider - supplies webpage content that must be treated as untrusted.
4. Model Provider - processes prompts/context and returns model output.

## Trust Boundaries

### Trust Boundary 1: User to OpenClaw
User instructions cross into the OpenClaw Gateway and agent environment.

### Trust Boundary 2: OpenClaw to Model Provider
Prompts and context leave the agent environment and are processed by the configured model service.

### Trust Boundary 3: External Web Content to Agent Context
Content retrieved from webpages enters the agent's context. This content is untrusted data and must not automatically receive the authority of a user instruction.

### Trust Boundary 4: Model/Agent Decision to Tool Execution
A model-generated proposal crosses into a system capable of executing a skill, shell command, or file operation. This is an important authorization boundary.

### Trust Boundary 5: OpenClaw to VM Operating System
Tool execution can interact with files and other resources provided by the Ubuntu VM.

## Threats and Controls

### Threat 1 - Indirect Prompt Injection
An attacker places instructions inside external content, such as a webpage, hoping the agent will interpret the data as trusted instructions.

Preventive control: Clearly separate untrusted external content from user instructions and restrict tool execution based on the authority of the instruction source.

Detective control: Record model runs and tool actions in OpenClaw audit logs and review unexpected tool proposals.

### Threat 2 - Unauthorized Tool Execution
The model may propose a tool or skill action that the user did not authorize.

Preventive control: Require approval at the tool-execution boundary and restrict which tools and arguments are permitted.

Detective control: Audit tool actions and compare them with the user's original request.

### Threat 3 - Malicious or Unexpected Tool Arguments
Untrusted text could influence arguments passed to a tool and cause behavior beyond the intended operation.

Preventive control: Use strict argument validation. The safe-marker script accepts only the exact argument `course-marker` and rejects other input.

Detective control: Log tool invocations and inspect the arguments used.

### Threat 4 - File System Modification
An agent with execution privileges could create, modify, or delete files outside the intended homework directory.

Preventive control: Apply least-privilege permissions and constrain skills to specific paths. The safe-marker skill is designed to write only to the homework marker location.

Detective control: Review filesystem changes and audit logs after agent runs.

### Threat 5 - Credential or Sensitive Data Exposure
Prompts, logs, or tools could expose API keys or other sensitive configuration information.

Preventive control: Keep credentials out of prompts, reports, screenshots, and the Git repository. Store credentials through appropriate environment or configuration mechanisms.

Detective control: Review evidence files and repository contents for accidentally included credentials before submission.

### Threat 6 - Compromised or Malicious External Content
A webpage may contain legitimate-looking information mixed with instructions designed to manipulate the agent.

Preventive control: Treat retrieved webpage content as untrusted data regardless of whether it is delivered over HTTP or HTTPS.

Detective control: Preserve the retrieved external content so that suspicious instructions can be compared with the resulting model and tool behavior.

## Exec Policy at the Tool-Decision Boundary

The output of `openclaw exec-policy show` is important because it describes the effective execution policy at the boundary between an agent proposing an action and the host executing it. In this environment, the output showed `security=full` and `ask=off` for the general execution policy. This indicates that the execution policy itself is permissive and does not provide a general interactive approval requirement for every execution.

However, the direct prompt-injection experiment encountered a separate approval boundary when the agent attempted to activate the safe-marker skill. The OpenClaw audit record showed the `skill_workshop` tool action as `blocked` after the approval request expired. Therefore, the experiment demonstrates why authorization should be enforced at or immediately before consequential tool execution rather than relying only on the model to decide whether an instruction is trustworthy.

## DFD Components

The data-flow diagram should contain the following components:

- User / Web UI
- OpenClaw Gateway
- Agent Context
- Model Provider
- Skill / Tool Decision
- Shell / File Operation
- Local Webpage Server
- Ubuntu VM Operating System

## DFD Data Flows

1. User -> OpenClaw Gateway: trusted user request
2. OpenClaw Gateway -> Agent Context: request and conversation context
3. Agent Context -> Model Provider: prompt and context
4. Model Provider -> Agent Context: model response or proposed action
5. Local Webpage Server -> Agent Context: untrusted webpage content
6. Agent Context -> Skill / Tool Decision: proposed tool action
7. Skill / Tool Decision -> Shell / File Operation: authorized execution
8. Shell / File Operation -> Ubuntu VM OS: filesystem or process operation
9. Tool execution -> OpenClaw/Audit Evidence: action result and metadata
