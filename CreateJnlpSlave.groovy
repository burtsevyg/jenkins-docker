import hudson.model.*
import jenkins.model.*
import hudson.slaves.*
import hudson.slaves.EnvironmentVariablesNodeProperty.Entry

import hudson.plugins.sshslaves.verifiers.*

// Define a "Launch method"
ComputerLauncher launcher = new JNLPLauncher()

// Define a "Permanent Agent"
Slave agent = new DumbSlave(
        "slave",
        "/home/jenkins",
        launcher)
agent.nodeDescription = "Description"
agent.numExecutors = 1
agent.labelString = "slave"
agent.mode = Node.Mode.NORMAL
agent.retentionStrategy = new RetentionStrategy.Always()

// Create a "Permanent Agent"
Jenkins.instance.addNode(agent)


return "Node has been created successfully."
