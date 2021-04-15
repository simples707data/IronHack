{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {
    "_kg_hide-input": true,
    "scrolled": true
   },
   "source": [
    "\n",
    "import pandas as pd\n",
    "reviews = pd.read_csv(\"../input/wine-reviews/winemag-data-130k-v2.csv\", index_col=0)\n",
    "pd.set_option('max_rows', 5)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# Two different ways to look up a column name in Pandas"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.country"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### AND"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews['country']"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### Then if we want to get to a specific row/value we can index that afterwards:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews['country'][0]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### This next peice of code does the same thing using the loc function. Here you say row first, then column. "
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.loc[0, 'country']"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### iloc has the advantage that you can ask for several columns at once"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.loc[:, ['taster_name', 'taster_twitter_handle', 'points']]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### If you a step further and reference the first character in a string in that value, you can do this: "
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.loc[0, 'country'] [0]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# Indexing in pandas\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.iloc[0]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Both `loc` and `iloc` are row-first, column-second. This is the opposite of what we do in native Python, which is column-first, row-second.\n",
    "\n",
    "This means that it's marginally easier to retrieve rows, and marginally harder to get retrieve columns. To get a column with `iloc`, we can do the following:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.iloc[:, 0]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "On its own, the `:` operator, which also comes from native Python, means \"everything\". When combined with other selectors, however, it can be used to indicate a range of values. For example, to select the `country` column from just the first, second, and third row, we would do:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.iloc[:3, 0]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Or, to select just the second and third entries, we would do:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.iloc[1:3, 0]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "It's also possible to pass a list:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.iloc[[0, 1, 2], 0]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Finally, it's worth knowing that negative numbers can be used in selection. This will start counting forwards from the _end_ of the values. So for example here are the last five elements of the dataset."
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.iloc[-5:]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# Change the index\n",
    "\n",
    "The `set_index()` method can be used to do the job. Here is what happens when we `set_index` to the `title` field:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.set_index('title')"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.set_index(reviews.iloc[:,0])\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# Filtering a Column/Conditional selection\n",
    "\n",
    "For example, suppose that we're interested specifically in better-than-average wines produced in Italy.\n",
    "\n",
    "We can start by checking if each wine is Italian or not:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.country == 'Italy'"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "This operation produced a Series of `True`/`False` booleans based on the `country` of each record.  This result can then be used inside of `loc` to select the relevant data:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.loc[reviews.country == 'Italy']"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "We also wanted to know which ones are better than average. Wines are reviewed on a 80-to-100 point scale, so this could mean wines that accrued at least 90 points.\n",
    "\n",
    "We can use the ampersand (`&`) to bring the two questions together:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.loc[(reviews.country == 'Italy') & (reviews['points'] >= 90)]\n",
    "#Note - deliberately using the two forms of label lookup. "
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### Suppose we'll buy any wine that's made in Italy __OR__ which is rated above average. For this we use a pipe (`|`):"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.loc[(reviews.country == 'Italy') | (reviews.points >= 90)]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### Filtering against multiple criteria using isin"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Pandas comes with a few built-in conditional selectors, two of which we will highlight here. \n",
    "\n",
    "The first is `isin`. `isin` is lets you select data whose value \"is in\" a list of values. For example, here's how we can use it to select wines only from Italy or France:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.loc[reviews['country'].isin(['Italy', 'France'])]"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### Selecting rows without Nulls"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "The second is `isnull` (and its companion `notnull`). These methods let you highlight values which are (or are not) empty (`NaN`). For example, to filter out wines lacking a price tag in the dataset, here's what we would do:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews.loc[reviews.price.notnull()]\n",
    "#again - switching between ways of reference a label - just to remind you there are two! - see above"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# Adding columns and data"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews['critic'] = 'everyone'\n",
    "reviews['critic']"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "Or with an iterable of values:"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {
    "scrolled": true
   },
   "source": [
    "reviews['index_backwards'] = range(len(reviews), 0, -1)\n",
    "reviews['index_backwards']"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# Your turn\n",
    "\n",
    "If you haven't started the exercise, you can **[get started here](https://www.kaggle.com/kernels/fork/587910)**."
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "---\n",
    "\n",
    "\n",
    "\n",
    "\n",
    "*Have questions or comments? Visit the [Learn Discussion forum](https://www.kaggle.com/learn-forum/161299) to chat with other Learners.*"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.8.5"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
