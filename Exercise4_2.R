#Titanic exercise from data visualization unit (unit 4.2)
#submitted by Maya Bhat-Gregerson

# The "Titanic" data set was provided by DataCamp

# 1 - Check the structure of titanic - make sure it is tidy. 
#In this case the data did not need to be restructured for use with ggplot.
str(titanic)
head(titanic)

# 2 - Plot 1 - Use ggplot() to plot distribution of sexes within the classes of the ship
# This plot is a bar graph with bars positioned next to each other
ggplot(titanic, aes(x = Pclass, fill = Sex)) +
  geom_bar(position = "dodge")

# 3 - Plot 2, added facet_grid() layer - this allowed us to look at the information
# in two separate plots: one showing the distribution of sex vs. class for those who survived
# and the other showing the same plot for those who didn't survive.
ggplot(titanic, aes(x = Pclass, fill = Sex)) +
  geom_bar(position = "dodge") +
  facet_grid(.~ Survived)

# 4 - Define an object for position jitterdodge.  This is used by reference to 
# the object name in the next plot.  It is used to avoid overplotting.
posn.jd <- position_jitterdodge(0.5, 0, 0.6)

# 5 - Plot 3, This is the same as Plot 2 except that we plot age vs. class for
# men and women separately and show this in two plots (one for survivors and one
# for those who did not survive.)
ggplot(titanic, aes(x = Pclass, y=Age, color = Sex)) +
  geom_point(position = posn.jd, size=3, alpha=0.5) +
  facet_grid(.~ Survived)

