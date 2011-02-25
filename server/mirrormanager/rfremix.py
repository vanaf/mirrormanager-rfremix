from mirrormanager.model import Product, Category, Arch, Directory

product = Product(name='RFRemix')

categories = {'RFRemix Linux':('fedora/russianfedora/releases','rsync://mirror.yandex.ru'),
             'RFRemix Repo Fixes':('fedora/russianfedora/russianfedora/fixes', 'rsync://mirror.yandex.ru'),
             'RFRemix Repo Free':('fedora/russianfedora/russianfedora/free', 'rsync://mirror.yandex.ru'),
             'RFRemix Repo Nonfree':('fedora/russianfedora/russianfedora/nonfree', 'rsync://mirror.yandex.ru'),
             'RFRemix Build':('fedora/russianfedora/build', 'rsync://mirror.yandex.ru')}
for name, (dirname, canonicalhost) in categories.iteritems():
   d = Directory(name=dirname)
   Category(product=product, name=name, canonicalhost=canonicalhost, topdir=d)
