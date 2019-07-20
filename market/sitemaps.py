from django.contrib.sitemaps import Sitemap


class StaticViewSitemap(Sitemap):

    def items(self):
        return ['home', 'only_shop', ]