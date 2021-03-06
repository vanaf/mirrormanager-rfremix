<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#"
    py:extends="'master.kid'">

    


<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" py:replace="''"/>
<title>Host Category</title>
</head>
<body>
<p>
Back to <a href="${tg.url('/site/' + str(host.site.id))}"><span
py:replace="host.site.name">Site Name</span></a> / 
<a href="${tg.url('/host/' + str(host.id))}"><span
py:replace="host.name">Host Name</span></a>
</p>

${form(value=values, action=tg.url(action), disabled_fields=disabled_fields)}
<div py:if="values is not None">
<h3>URLs serving this content</h3>
<p>
The same content may be served by multiple means: http, ftp, and rsync
are common examples.  Content may also be served via a 'private' URL
only visible to other mirror admins.  Such private URLs usually
include a nonstandard rsync port, and/or a username and password.
Admins from Mirror Sites on your SiteToSite list can see these private URLs.
</p>


	<a href="${tg.url('/host_category_url/0/new?hcid=' + str(values.id))}">[Add]</a>
<ul>
	  <li py:for="url in values.urls">
	  <span py:replace="url.url">URL</span> 	      <span py:if="url.private">(Mirrors)</span>
	  <a href="${tg.url('/host_category_url/' + str(url.id) + '/delete')}">[Delete]</a>
	  </li>
</ul>

<h3>Up-to-Date Directories this host carries</h3>
<div py:if="values.always_up2date">
<p>
<em>Note:</em> This HostCategory is marked <em>always_up2date</em>.
It is believed to carry the complete content of the master under this
category, and is always in sync with the master.  Consult a sysadmin if this is incorrect.
</p>
</div>

<ul>
<li py:for="dir in values.dirs" py:if="dir.up2date">
    <span py:replace="dir.path">Path</span>
</li>
</ul>
</div>
</body>
</html>
