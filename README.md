# axi-assignment

Infrastructure Overview:

This plan utilizes Azure services to create a secure and scalable environment for our web services while maintaining secure access to your internal "internal-assets" virtual network.

1. Azure Virtual Network (VNet):
![image](https://github.com/akshayahuja2187/axi-assignment/assets/27176246/0703dc49-87da-4f99-9e0e-39d5907d6da3)

Create a VNet within our Azure subscription. This VNet will house all our AKS resources.
Designate two subnets within the VNet:
  Public Subnet: Web services deployed here will be accessible from the internet.
  Private Subnet: Internal components that don't require public exposure will reside here.
2. AKS Cluster:

![image](https://github.com/akshayahuja2187/axi-assignment/assets/27176246/4a543639-8a34-41ff-bf2f-6cc685c00287)

Deploy an AKS cluster within the VNet. AKS is a managed Kubernetes service that simplifies cluster management and maintenance.
3. Internal Network Access:

Option A: Azure VNet Gateway with Point-to-Site VPN

  ![image](https://github.com/akshayahuja2187/axi-assignment/assets/27176246/41317a14-6abc-4e36-a656-4f0e7ecbcd88)

  Configure a VNet Gateway within our VNet.
  Establish a secure tunnel between our VNet and the "internal-assets" virtual network using a Point-to-Site VPN connection. This encrypts data in transit between the two networks.
Option B: Azure ExpressRoute (For dedicated high-bandwidth)

  ![image](https://github.com/akshayahuja2187/axi-assignment/assets/27176246/c7cbc506-6700-4604-8b08-7dfef410c4e8)

  For dedicated, high-bandwidth connectivity, consider setting up Azure ExpressRoute to directly connect our VNet to the "internal-assets" virtual network. ExpressRoute bypasses the internet and provides a more reliable and secure connection.

4. Web Services and Security:

Deploy our web services in the public subnet of the VNet.
Implement security measures within the AKS cluster:
  Network Policies: Restrict communication between pods and enforce least privilege access.
  Pod Security Policies: Define security baselines for pods running in the cluster.
  Azure Key Vault: Store sensitive information securely.
  Azure Active Directory (AAD): Configure AAD roles for least privilege access.

5. Monitoring and Alerting:

  Utilize Azure Monitor for cluster health, application performance tracking, and configuring alerts to notify the support team if web services lose connectivity to the internal assets network.

6. Developer Deployments:

  Implement a CI/CD pipeline using Github actions.
  Integrate the CI/CD pipeline with our version control system to automate code building, testing, and deployment to the AKS cluster.

Benefits:

  Isolation and Security: Public and internal components are segregated within the VNet, enhancing overall security.
  Secure Internal Network Access: Point-to-Site VPN or ExpressRoute provides secure communication with the internal-assets network.
  Managed Service: AKS simplifies Kubernetes cluster management and maintenance.
  Automated Deployments: CI/CD pipeline streamlines code deployment for developers.
  Azure Monitor: Ensures proactive identification and notification of potential issues impacting internal network connectivity.

This is a high-level overview, and specific implementation details will vary based on specific requirements.
We would need to regularly review and update our security practices to maintain a strong security posture.
By following these recommendations and leveraging the provided diagrams, we can gain a clearer understanding of how to build a secure and scalable environment for our web services on AKS with secure access to our internal network.
