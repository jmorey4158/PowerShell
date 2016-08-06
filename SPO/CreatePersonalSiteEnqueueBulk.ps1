
#Specify the absolute URL for the SharePoint Site to enqueue. 
$webUrl = "deleted"


#Specify the login name for the site administrator. If you do not specify the login name, the console will prompt you for it.
$username = "admin@deleted"


#Specify the password for the site administrator.  If you do not specify the login name, the console will prompt you for it.
$password


#Specify the login name to be enqueued.  If you do not specify the site, the console will prompt you for it.
$user = "admin@deleted"




#Create the ClientContext. For more information, see http://msdn.microsoft.com/en-us/library/office/ee540980(v=office.15).aspx
$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($webUrl)
$web = $ctx.Web
$password = read-host -AsSecureString
$ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username,$passord)
$ctx.Load($web)
$ctx.ExecuteQuery()


#Create UserProfile Loader for ClientContext. Represents a client-side user profile for a person. For more information, see http://msdn.microsoft.com/en-us/library/office/microsoft.sharepoint.client.userprofiles.userprofile(v=office.15).aspx
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint.Client.UserProfiles")
$loader =[Microsoft.SharePoint.Client.UserProfiles.ProfileLoader]::GetProfileLoader($ctx)


#Get UserProfile
$profile = $loader.GetUserProfile()
$ctx.Load($profile)
$ctx.ExecuteQuery()
# $profile


#Enqueues user to be able to create a personal site. A personal site can be used to share documents, sites, and other files.
$loader.CreatePersonalSiteEnqueueBulk(@($user))
$loader.Context.ExecuteQuery()
