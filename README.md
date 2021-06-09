# RAILS PORTFOLIO PROJECT README

Investment Management Platform

Description:

My user is a finance professional working at an investment firm. He or she works on teams of other finance professionals ("deal teams") to review new investment opportunities ("deals"). The user logs into the application to create a new investment opportunity ("deal"), enter information about that deal (financial metrics and assumptions), and the application calculates the price they can pay for the business. The user also adds his or her team members to the deal (other users) so they can also see the deal information and edit / update it. Certain senior users ("Managing Directors") can see all deals while junior users can only see the deals that they are a part of (i.e., on the "deal team" of).

Deployment Instructions

Run "Bundle Install" to ensure all required Ruby Gems are installed locally. Run "rails s" in the console to start the development server locally on localhost:3000.

Note: Github Omniauth implementation requires a secret key which is not included on the public Github repo. Create a new file called '.env' and add your own Github Client / Secret key to utilize that feature.