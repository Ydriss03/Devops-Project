echo "=== OS ==="
cat /etc/os-release | grep -E 'PRETTY_NAME|VERSION='

echo
echo "=== CPU Usage  ==="
lscpu | grep -E 'Model name|CPU\(s\)|Architecture'

echo 
echo "=== Memory usage (RAM) ==="
free -h
free | grep "Mem:"| awk '{print "Memory Usage:", int($3/$2*100) "%"}' 
echo
echo "=== Disk Usage ==="
df -h /

echo
echo "=== Network ==="
hostname -I

echo
echo "=== Kernel ==="
uname -r

echo
echo "==Top 5 processes by CPU=="
ps aux --sort=-%cpu |  head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $11}'


echo
echo "==top 5 processes  by memory=="
ps aux --sort=-%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $11}' 

echo
echo "==User==="
w


