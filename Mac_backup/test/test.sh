
# com=`comm -12 1 2`
# # echo $com
# # if [ $com == "" ]; then
# if [ -z "$com" ]; then
    # echo "No comm"
# else
    # echo $com
# fi

cplist="bash_profile"
for i in $cplist; do 
    # check whether thre any simple line contents exists in the configure file
    # grep -qf $i ~/.bashrc
    com=`comm -12 $i ~/.bash_profile`
    if [ -z "$com" ]; then
        cat $i >> 3
    # else
        # echo "There are commons between src and tgt files" >> 3
    fi
done

### Check if a directory does not exist ###
dir=~/.vim/bundle/Vundle.vim/
if [ -d "$dir" ]
then
    echo "Directory /path/to/dir DOES exists."
    # :
else
    echo "Directory /path/to/dir DOES NOT exists."
fi
