<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function Add-SPOUserToCreatePersonalSite
{
    [CmdletBinding()]
    [OutputType([string[]])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [string]
        $WebURL,

        
        # Param2 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [string]
        $TenantAdminUserName,

        
        # Param2 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [string]
        $TenantAdminPassword,

        
        # Param4 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [string[]]
        $UsersToAdd

    )

    Begin
    {

        #Create the ClientContext. For more information, see http://msdn.microsoft.com/en-us/library/office/ee540980(v=office.15).aspx
        $ctx = New-Object Microsoft.SharePoint.Client.ClientContext($WebURL)
        $web = $ctx.Web
        $ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($TenantAdminUserName,$TenantAdminPassword)
        $ctx.Load($web)
        $ctx.ExecuteQuery()

    }
    Process
    {
        #Create UserProfile Loader for ClientContext. Represents a client-side user profile for a person. For more information, see http://msdn.microsoft.com/en-us/library/office/microsoft.sharepoint.client.userprofiles.userprofile(v=office.15).aspx
        [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint.Client.UserProfiles")
        $loader =[Microsoft.SharePoint.Client.UserProfiles.ProfileLoader]::GetProfileLoader($ctx)


        #Get UserProfile
        $profile = $loader.GetUserProfile()
        $ctx.Load($profile)
        $ctx.ExecuteQuery()
        # $profile


        #Enqueues user to be able to create a personal site. A personal site can be used to share documents, sites, and other files.
        $loader.CreatePersonalSiteEnqueueBulk(@($UsersToAdd))
        $loader.Context.ExecuteQuery()

    }
    End
    {
    }
}