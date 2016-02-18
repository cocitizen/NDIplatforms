cmd=make-lock
tmp_dir=tmp
d=$(tmp_dir)/drush
ts=`date --iso-8601=seconds`


list:
	cat Makefile | grep "^[[:alpha:]]" | grep ":" | grep -v "^locks" | sed s/:[^:]*//

clean:
	rm -rf $(tmp_dir)

drush:
	mkdir -p $(tmp_dir)
	curl -SsL -z $(d) -o $(d) http://files.drush.org/drush.phar
	chmod a+x $(d)

drush-unstable:
	mkdir -p $(tmp_dir)
	curl -SsL -z $(d) -o $(d) http://files.drush.org/drush-unstable.phar
	chmod a+x $(d)

drush-source:
	mkdir -p $(tmp_dir)
	cd $(tmp_dir); curl -SsL -z ./composer.phar https://getcomposer.org/installer | php
	chmod a+x $(tmp_dir)/composer.phar
	cd $(tmp_dir); ./composer.phar require drush/drush:dev-master --prefer-source
	rm $(d); cd $(tmp_dir); ln -s vendor/drush/drush/drush drush
	chmod a+x $(d)

all: stock demtools

stock: drupal7 drupal8 dkan civicrm

demtools: demtools-dkan demtools-civi


drupal7: locks/drupal7.lock.yml

locks/drupal7.lock.yml: stubs/drupal7.make.yml
	$(d) $(cmd) stubs/drupal7.make.yml --result-file=locks/drupal7.lock.yml


drupal8: locks/drupal8.lock.yml

locks/drupal8.lock.yml: stubs/drupal8.make.yml
	$(d) $(cmd) stubs/drupal8.make.yml --result-file=locks/drupal8.lock.yml


dkan: drupal7 locks/dkan.lock.yml

locks/dkan.lock.yml: stubs/dkan.make.yml
	$(d) $(cmd) stubs/dkan.make.yml --result-file=locks/dkan.lock.yml

demtools-dkan: dkan locks/demtools-dkan.lock.yml

locks/demtools-dkan.lock.yml: stubs/demtools-dkan.make.yml includes/dkan/*
	$(d) $(cmd) stubs/demtools-dkan.make.yml --result-file=locks/demtools-dkan.lock.yml

test-demtools-dkan: demtools-dkan
	$(d) make locks/demtools-dkan.lock.yml $(tmp_dir)/demtools-dkan-$(ts)


civicrm: drupal7 locks/civicrm.lock.yml

locks/civicrm.lock.yml: stubs/civicrm.make.yml includes/civicrm/*
	$(d) $(cmd) stubs/civicrm.make.yml --result-file=locks/civicrm.lock.yml

demtools-civi: civicrm locks/demtools-civi.lock.yml

locks/demtools-civi.lock.yml: stubs/demtools-civi.make.yml
	$(d) $(cmd) stubs/demtools-civi.make.yml --result-file=locks/demtools-civi.lock.yml


