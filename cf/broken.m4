dnl $Id$
dnl
dnl
dnl Same as AC _REPLACE_FUNCS, just define HAVE_func if found in normal
dnl libraries 

AC_DEFUN(AC_BROKEN,
[for ac_func in $1
do
AC_CHECK_FUNC($ac_func, [
ac_tr_func=HAVE_[]upcase($ac_func)
AC_DEFINE_UNQUOTED($ac_tr_func)],[LIBOBJS="$LIBOBJS ${ac_func}.o"])
# autoheader tricks *sigh*
: << END
@@@funcs="$funcs $1"@@@
END
done
AC_SUBST(LIBOBJS)dnl
])
