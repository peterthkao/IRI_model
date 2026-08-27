program basictest
use, intrinsic:: iso_fortran_env, only: stderr=>error_unit
implicit none

logical, parameter :: jf(50) = .true.
integer, parameter :: jmag = 1, iyyyy=1980, mmdd=0321, dhour=12, Nalt = 21
real, parameter :: glat=0., glon=0.
real,parameter :: alt_km_range(3) = [100., 500., 20.]
character(*), parameter :: datadir='data'

real :: oarr(100), outf(20,1000), altkm(Nalt)
integer :: i

altkm(1) = alt_km_range(1)
do i = 2,Nalt
  altkm(i) = altkm(i-1) + alt_km_range(3)
enddo


call IRI_SUB(JF,JMAG,glat,glon,IYYYY,MMDD,DHOUR+25., &
     alt_km_range(1), alt_km_range(2), alt_km_range(3), &
     OUTF,OARR, datadir)

print '(A,ES10.3,A,F5.1,A)','NmF2 ',oarr(1),' [m^-3]     hmF2 ',oarr(2),' [km] '
print '(A,F10.3,A,I3,A,F10.3)','F10.7 ',oarr(41), ' Ap ',int(oarr(51)),' B0 ',oarr(10)

print *,'Altitude (km)    Ne (m^-3)'
do i = 1,Nalt
  print '(F10.3, ES15.7)',altkm(i), outf(1,i)
enddo


if (outf(1,i-1) < 0) then
  write(stderr,*) 'output length short'
  stop 1
endif
if (outf(1,i) > 0) then
  write(stderr,*) 'output length long'
  stop 1
endif

end program
