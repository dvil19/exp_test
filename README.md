## Improvements that could be made with more time/resources

- Deploy SSL to the end user end-points
- Integrate SSO for administrative end points
- Create a branching strategy to manage CI/CD to different environments (i.e dev, stage, prod, etc)
- Deploy to EKS instead of EC2
- Use helm charts to build the entire application environment, keep history in case rollbacks are required
- Use ECR to store the container images
- Use autoscaling group in EC2 or at the EKS backend
- Automate packer build and pass it as variable for next steps
- Use artifact repository (Jfrog, nexus or something else to store CI/CD build artifacts and use in further steps)
- Monitor the solution (prometheus/grafana if opensource or newrelic/dynatrace agents)
- Place cloudfront or any other CDN in front of the LB
- Automated testing included in the CI/CD steps
- Use configuration management tool to configure the servers after IaC runs (ansible, puppet, chef) - if EC2 is required
- Use GitLab or GitHub enterprise as the orchestration tool which integrates SCM and CI/CD into a single tool (easier management)
- Encrypt secrets using sops or any other encryption tool for credentials or use a vault that can be integrated on CI/CD
- Use variables in terraform for the different environments/values (like CIDR blocks, subnets, etc)
- Use shared storage (EFS) or automatically create PVC with an EBS backend if on containers
- Fully automate the github webhook trigger, i.e. pull request builds the solution and the approval deploys it

