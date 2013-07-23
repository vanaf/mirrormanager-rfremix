from mirrormanager.model import Product, Category, Arch, Directory

product = Product(name='RFRemix')

categories = {'RFRemix Linux':('releases/RFRemix','rsync://mirror.yandex.ru/fedora/russianfedora'),
             'RFRemix Repo Fixes':('russianfedora/fixes/fedora', 'rsync://mirror.yandex.ru/fedora/russianfedora'),
             'RFRemix Repo Free':('russianfedora/free/fedora', 'rsync://mirror.yandex.ru/fedora/russianfedora'),
             'RFRemix Repo Nonfree':('russianfedora/nonfree/fedora', 'rsync://mirror.yandex.ru/fedora/russianfedora'),
             'RFRemix Build':('build', 'rsync://mirror.yandex.ru/fedora/russianfedora'),
             'RFRemix Stage':('stage', 'rsync://mirror.yandex.ru/fedora/russianfedora')}
for name, (dirname, canonicalhost) in categories.iteritems():
   d = Directory(name=dirname)
   Category(product=product, name=name, canonicalhost=canonicalhost, topdir=d)

product = Product(name='RERemix')

categories = {'RERemix Linux':('releases/RERemix','rsync://mirror.yandex.ru/fedora/russianfedora'),
             'RERemix Repo Fixes':('russianfedora/fixes/el', 'rsync://mirror.yandex.ru/fedora/russianfedora'),
             'RERemix Repo Free':('russianfedora/free/el', 'rsync://mirror.yandex.ru/fedora/russianfedora'),
             'RERemix Repo Nonfree':('russianfedora/nonfree/el', 'rsync://mirror.yandex.ru/fedora/russianfedora')}
for name, (dirname, canonicalhost) in categories.iteritems():
   d = Directory(name=dirname)
   Category(product=product, name=name, canonicalhost=canonicalhost, topdir=d)
