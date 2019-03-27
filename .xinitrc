xrdb -load .Xdefaults
xrdb -merge .Xresources
xset -b &
exec conky &
exec compton &
exec nitrogen --restore &
exec cwm
