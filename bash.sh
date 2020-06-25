#echo" service command triggered"
#supervisord
echo "clonning project"
git clone https://github.com/tusharjadhav29/m2-test.git -v /var/www/html/m2
echo "composer install command is running"
cd /var/www/html/m2 && composer install -v
echo "running bin/magento command to connect with database"
cd /var/www/html/m2 && bin/magento setup:install --base-url=http://52.136.127.138:32060/ --db-host=magento-mysql --db-name=magento --db-user=root --db-password=redhat --admin-firstname=rahul --admin-lastname=chauhan --admin-email=rahul.chauhan@adapty.com --admin-user=rahul --admin-password=admin@123 --backend-frontname=admin --language=en_US --currency=KWD --cleanup-database --use-rewrites=1
echo "running permission command"
cd /var/www/html/m2 && find var vendor pub/static pub/media app/etc -type f -exec chmod g+w {} \;
cd /var/www/html/m2 && find var vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} \;
cd /var/www/html/m2 && chmod u+x bin/magento
cd /var/www/html/m2 && bin/magento cache:status
cd /var/www/html/m2 && bin/magento cache:flush
cd /var/www/html/m2 && bin/magento indexer:reindex
cd /var/www/html/m2 && bin/magento setup:upgrade
cd /var/www/html/m2 && bin/magento setup:di:compile
cd /var/www/html/m2 && bin/magento setup:static-content:deploy -f
cd /var/www/html/m2 && bin/magento deploy:mode:set production
cd /var/www/html/m2 && bin/magento info:adminuri
cd /var/www/html/m2 && chmod -R 777 var/ generated/ pub/static pub/media/
cd /var/www/html/m2 && bin/magento setup:static-content:deploy
cd /var/www/html/m2 && chmod -R 777 var/ generated/ pub
echo "setup is done"

