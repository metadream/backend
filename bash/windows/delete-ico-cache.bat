taskkill /f /im explorer.exe

attrib -h -s -r "%userprofile%\AppData\Local\IconCache.db"
del /f "%userprofile%\AppData\Local\IconCache.db"

attrib -h -s -r "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\iconcache_*.db"
attrib -h -s -r "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\iconcache_*.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db"

start explorer