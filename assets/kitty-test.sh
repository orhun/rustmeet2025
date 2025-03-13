printf "\e]66;s=2;Double sized text\a\n\n"
printf "\e]66;s=3;Triple sized text\a\n\n\n"
printf "\e]66;n=1:d=2;Half sized text\a\n"

printf "\e]66;h=2:s=3;Σ\a\e]66;n=1:d=2:v=0;n\a\n(S\e]66;n=1:d=2:v=1;i\a + S\e]66;n=1:d=2:v=1;i+1\a)\n\e]66;n=1:d=2:v=1;i=1\a\n\n"
printf "\e]66;s=2:w=3:v=2:n=1:d=2;f(x) = \a\e]66;h=2:s=2:v=2;∫\a\e]66;v=1; ∞\a\e]66;s=2:w=3:v=2:n=1:d=2;2πx\a\n\e]66;v=0;-∞\a\n\n\n"
sleep 10
