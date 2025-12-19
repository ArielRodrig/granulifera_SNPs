cd $WORKDIR/stairway_plot

# Using realSFS from angsd after subsetting  to exclude CDS

java -cp stairway_plot_es Stairbuilder greens.realSFS.blueprint
bash greens.realSFS.blueprint.sh

java -cp stairway_plot_es Stairbuilder PAL.realSFS.blueprint
bash PAL.realSFS.blueprint.sh

java -cp stairway_plot_es Stairbuilder SAN.realSFS.blueprint
bash SAN.realSFS.blueprint.sh


