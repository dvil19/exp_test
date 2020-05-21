# Interview Exam

Proposed solution by Daniel Villanea

## Improvements that could be made with more time/resources

- Fully automate the github webhook trigger, i.e. pull request builds the solution and the approval deploys it
- Deploy to EKS instead of EC2
- Use helm charts to build the entire application environment, keep history in case rollbacks are required
- Use ECR to store the container images
- Deploy SSL to the end user end-points
- Integrate SSO for administrative end points
- Use autoscaling group on the EKS backend, or an autoscaling group in EC2
- Automate packer build and pass it as variable for next steps
- Use artifact repository (Jfrog, nexus or something else to store CI/CD build artifacts and use in further steps)
- Monitor the solution (prometheus/grafana if opensource or newrelic/dynatrace agents)
- Place cloudfront or any other CDN in front of the LB
- Create a branching strategy to manage CI/CD to different environments (i.e dev, stage, prod, etc)
- Automated testing included in the CI/CD steps
- Use configuration management tool to deploy into the infrastructure environments (ansible, puppet, chef) - if EC2 is required
- Use GoCD or GitLab as the orchestration tool
- Encrypt secrets using sops or any other encryption tool for credentials
- Use variables in terraform for the different environments/values (like CIDR blocks, subnets, etc)

## Author

* **Daniel Villanea** - *Initial work* 
