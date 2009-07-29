<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#"
    py:extends="'static.kid'">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" py:replace="''"/>
<title>${title}</title>

</head>
<body>
<div class="floatright">
<table cellspacing="0" class="compact altrows minilist">
  <caption><strong>Mirror list filter</strong></caption>
  <tr><th colspan="2">Version</th><th colspan='0'>Architecture</th></tr>
  <span py:for="p in products">
  <?python
displayversions = [v for v in p.versions if v.display]
?>
  <tr class="separator" py:attrs="{'rowspan': len(displayversions)}">
    <th colspan="0">
      <a href="${tg.url('/publiclist/' + p.name + '/')}" py:content="p.name" />
    </th>
  </tr>
  <tr py:for="i,v in enumerate(displayversions)"
      py:attrs="{'class': i%2 and 'odd' or 'even'}">
<?python
display_name = v.name
if v.display_name is not None and v.display_name != '':
   display_name = v.display_name
?>
    <td></td><td><a href="${tg.url('/publiclist/' + p.name + '/' + v.name + '/')}">
      <strong py:content="display_name" /></a></td>
	<td py:for="a in arches"><a href="${tg.url('/publiclist/' +
	p.name + '/' + v.name + '/' + a.name + '/')}"
	py:if="len(pvaMatrix.get_pva(p.name, v.name, a.name)) > 0" py:content="a.name" /></td>
  </tr>
  </span>
</table>
</div>

<h1 class="icon48 download">${title}</h1>

<p>
${tg.config('mirrormanager.projectname','Fedora')} is distributed to millions of systems globally.  This would not
be possible without the donations of time, disk space, and bandwidth
by hundreds of volunteer system administrators and their companies or
institutions.  Your fast download experience is made possible by these
donations.
This list is dynamically generated every hour, listing only up-to-date mirrors.
</p>
<p>
To become a public ${tg.config('mirrormanager.projectname','Fedora')} mirror, please see <a
  py:attrs="{'href': tg.config('mirrormanager.mirrorwiki', 'http://fedoraproject.org/wiki/Infrastructure/Mirroring')}">
our wiki page on Mirroring</a>.
</p>

<p>
You may trim the selection through the links on the right, or see the <a
href="${tg.url('/publiclist')}">whole list</a>.
</p>
<p>
I2 means both Internet2 and its peer high speed research
and development networks globally.
</p>

<div class="keepleft">

<h2 class="icon24 download" style="clear: both;">${pva} Public Active Mirrors (${numhosts} with aggregate ${bandwidth} Gbits/sec)</h2>

<p py:if="len(hosts) == 0">There are no mirrors matching your your search criteria.</p>

<table border="1" class="altrows">
<tr><th>Country</th><th>Site</th><th>Host</th><th>Content</th><th>Bandwidth (Mbits/sec)</th><th>I2</th><th>Comments</th></tr>
<tr py:for="i,host in enumerate(hosts)"
    py:attrs="{'class': i%2 and 'odd' or 'even'}">
<td><span py:if="host.country is not None" py:replace="host.country.upper()">Country</span></td>
<td><a href="${host.site_url}"><span py:replace="host.site_name">Site Name</span></a></td>
<td><span py:replace="host.name">Host Name</span></td>

<td>
<table>
<?python
   categories = host.categories.keys()
   categories.sort()
?>
<tr py:for="hc in categories">
<td><span py:replace="host.categories[hc].name">Category name</span></td>
<td><span py:if="host.categories[hc].http_url is not None"><a href="${host.categories[hc].http_url}">http</a></span></td>
<td><span py:if="host.categories[hc].ftp_url is not None"><a href="${host.categories[hc].ftp_url}">ftp</a></span></td>
<td><span py:if="host.categories[hc].rsync_url is not None"><a href="${host.categories[hc].rsync_url}">rsync</a></span></td>
</tr>
</table>
</td>
<td><span py:replace="host.bandwidth_int">Bandwidth</span></td>
<td>
<?python
   i2='No'
   if host.internet2:
       i2='Yes'
?>
<span py:replace="i2">Internet2</span></td>
<td><span py:replace="host.comment">Comment</span></td>
</tr>
</table>
</div>
</body>
</html>
