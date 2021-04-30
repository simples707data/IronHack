{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "metadata": {},
   "outputs": [],
   "source": [
    "import numpy as np\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "metadata": {},
   "outputs": [],
   "source": [
    "import pandas as pd"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "metadata": {},
   "outputs": [],
   "source": [
    "file1 = pd.read_csv(r\"marketing_customer_analysis_x.csv\")\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Unnamed: 0</th>\n",
       "      <th>customer</th>\n",
       "      <th>state</th>\n",
       "      <th>customer_lifetime_value</th>\n",
       "      <th>response</th>\n",
       "      <th>coverage</th>\n",
       "      <th>education</th>\n",
       "      <th>effective_to_date</th>\n",
       "      <th>employmentstatus</th>\n",
       "      <th>gender</th>\n",
       "      <th>...</th>\n",
       "      <th>months_since_policy_inception</th>\n",
       "      <th>number_of_open_complaints</th>\n",
       "      <th>number_of_policies</th>\n",
       "      <th>policy_type</th>\n",
       "      <th>policy</th>\n",
       "      <th>renew_offer_type</th>\n",
       "      <th>sales_channel</th>\n",
       "      <th>total_claim_amount</th>\n",
       "      <th>vehicle_class</th>\n",
       "      <th>vehicle_size</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>0</td>\n",
       "      <td>BU79786</td>\n",
       "      <td>Washington</td>\n",
       "      <td>2763.519279</td>\n",
       "      <td>No</td>\n",
       "      <td>Basic</td>\n",
       "      <td>Bachelor</td>\n",
       "      <td>8/24/11</td>\n",
       "      <td>Employed</td>\n",
       "      <td>F</td>\n",
       "      <td>...</td>\n",
       "      <td>5</td>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>Corporate Auto</td>\n",
       "      <td>Corporate L3</td>\n",
       "      <td>Offer1</td>\n",
       "      <td>Agent</td>\n",
       "      <td>384.811147</td>\n",
       "      <td>Two-Door Car</td>\n",
       "      <td>Medsize</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>1</td>\n",
       "      <td>QZ44356</td>\n",
       "      <td>Arizona</td>\n",
       "      <td>6979.535903</td>\n",
       "      <td>No</td>\n",
       "      <td>Extended</td>\n",
       "      <td>Bachelor</td>\n",
       "      <td>12/31/11</td>\n",
       "      <td>Unemployed</td>\n",
       "      <td>F</td>\n",
       "      <td>...</td>\n",
       "      <td>42</td>\n",
       "      <td>0</td>\n",
       "      <td>8</td>\n",
       "      <td>Personal Auto</td>\n",
       "      <td>Personal L3</td>\n",
       "      <td>Offer3</td>\n",
       "      <td>Agent</td>\n",
       "      <td>1131.464935</td>\n",
       "      <td>Four-Door Car</td>\n",
       "      <td>Medsize</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>2</td>\n",
       "      <td>AI49188</td>\n",
       "      <td>Nevada</td>\n",
       "      <td>12887.431650</td>\n",
       "      <td>No</td>\n",
       "      <td>Premium</td>\n",
       "      <td>Bachelor</td>\n",
       "      <td>7/19/11</td>\n",
       "      <td>Employed</td>\n",
       "      <td>F</td>\n",
       "      <td>...</td>\n",
       "      <td>38</td>\n",
       "      <td>0</td>\n",
       "      <td>2</td>\n",
       "      <td>Personal Auto</td>\n",
       "      <td>Personal L3</td>\n",
       "      <td>Offer1</td>\n",
       "      <td>Agent</td>\n",
       "      <td>566.472247</td>\n",
       "      <td>Two-Door Car</td>\n",
       "      <td>Medsize</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>3</td>\n",
       "      <td>WW63253</td>\n",
       "      <td>California</td>\n",
       "      <td>7645.861827</td>\n",
       "      <td>No</td>\n",
       "      <td>Basic</td>\n",
       "      <td>Bachelor</td>\n",
       "      <td>7/20/11</td>\n",
       "      <td>Unemployed</td>\n",
       "      <td>M</td>\n",
       "      <td>...</td>\n",
       "      <td>65</td>\n",
       "      <td>0</td>\n",
       "      <td>7</td>\n",
       "      <td>Corporate Auto</td>\n",
       "      <td>Corporate L2</td>\n",
       "      <td>Offer1</td>\n",
       "      <td>Call Center</td>\n",
       "      <td>529.881344</td>\n",
       "      <td>SUV</td>\n",
       "      <td>Medsize</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>4</td>\n",
       "      <td>HB64268</td>\n",
       "      <td>Washington</td>\n",
       "      <td>2813.692575</td>\n",
       "      <td>No</td>\n",
       "      <td>Basic</td>\n",
       "      <td>Bachelor</td>\n",
       "      <td>11/3/11</td>\n",
       "      <td>Employed</td>\n",
       "      <td>M</td>\n",
       "      <td>...</td>\n",
       "      <td>44</td>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>Personal Auto</td>\n",
       "      <td>Personal L1</td>\n",
       "      <td>Offer1</td>\n",
       "      <td>Agent</td>\n",
       "      <td>138.130879</td>\n",
       "      <td>Four-Door Car</td>\n",
       "      <td>Medsize</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "<p>5 rows × 25 columns</p>\n",
       "</div>"
      ],
      
      "text/plain": [
       "   Unnamed: 0 customer       state  customer_lifetime_value response  \\\n",
       "0           0  BU79786  Washington              2763.519279       No   \n",
       "1           1  QZ44356     Arizona              6979.535903       No   \n",
       "2           2  AI49188      Nevada             12887.431650       No   \n",
       "3           3  WW63253  California              7645.861827       No   \n",
       "4           4  HB64268  Washington              2813.692575       No   \n",
       "\n",
       "   coverage education effective_to_date employmentstatus gender  ...  \\\n",
       "0     Basic  Bachelor           8/24/11         Employed      F  ...   \n",
       "1  Extended  Bachelor          12/31/11       Unemployed      F  ...   \n",
       "2   Premium  Bachelor           7/19/11         Employed      F  ...   \n",
       "3     Basic  Bachelor           7/20/11       Unemployed      M  ...   \n",
       "4     Basic  Bachelor           11/3/11         Employed      M  ...   \n",
       "\n",
       "   months_since_policy_inception number_of_open_complaints number_of_policies  \\\n",
       "0                              5                         0                  1   \n",
       "1                             42                         0                  8   \n",
       "2                             38                         0                  2   \n",
       "3                             65                         0                  7   \n",
       "4                             44                         0                  1   \n",
       "\n",
       "      policy_type        policy  renew_offer_type  sales_channel  \\\n",
       "0  Corporate Auto  Corporate L3            Offer1          Agent   \n",
       "1   Personal Auto   Personal L3            Offer3          Agent   \n",
       "2   Personal Auto   Personal L3            Offer1          Agent   \n",
       "3  Corporate Auto  Corporate L2            Offer1    Call Center   \n",
       "4   Personal Auto   Personal L1            Offer1          Agent   \n",
       "\n",
       "   total_claim_amount  vehicle_class vehicle_size  \n",
       "0          384.811147   Two-Door Car      Medsize  \n",
       "1         1131.464935  Four-Door Car      Medsize  \n",
       "2          566.472247   Two-Door Car      Medsize  \n",
       "3          529.881344            SUV      Medsize  \n",
       "4          138.130879  Four-Door Car      Medsize  \n",
       "\n",
       "[5 rows x 25 columns]"
      ]
     },
     "execution_count": 4,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "file1.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(9134, 25)"
      ]
     },
     "execution_count": 5,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "file1.shape"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "metadata": {},
   "outputs": [],
   "source": [
    "file1 = file1.drop(['Unnamed: 0'],axis=1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Index(['customer', 'state', 'customer_lifetime_value', 'response', 'coverage',\n",
       "       'education', 'effective_to_date', 'employmentstatus', 'gender',\n",
       "       'income', 'location_code', 'marital_status', 'monthly_premium_auto',\n",
       "       'months_since_last_claim', 'months_since_policy_inception',\n",
       "       'number_of_open_complaints', 'number_of_policies', 'policy_type',\n",
       "       'policy', 'renew_offer_type', 'sales_channel', 'total_claim_amount',\n",
       "       'vehicle_class', 'vehicle_size'],\n",
       "      dtype='object')"
      ]
     },
     "execution_count": 7,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "file1.columns"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(9134, 24)"
      ]
     },
     "execution_count": 8,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "file1.shape"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "metadata": {},
   "outputs": [],
   "source": [
    "#resetting the idex (refreshing the data frame)\n",
    "file1.reset_index(drop=True, inplace=True)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Revoing rows with no numbers and empty rows (not an issue with this data set but worth doing)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "metadata": {
    "scrolled": false
   },
   "outputs": [],
   "source": [
    "##This code removes rows where there are no numners (NaN cells only)\n",
    "missingdata=file1.isna().all(axis=1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "metadata": {
    "scrolled": true
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>customer</th>\n",
       "      <th>state</th>\n",
       "      <th>customer_lifetime_value</th>\n",
       "      <th>response</th>\n",
       "      <th>coverage</th>\n",
       "      <th>education</th>\n",
       "      <th>effective_to_date</th>\n",
       "      <th>employmentstatus</th>\n",
       "      <th>gender</th>\n",
       "      <th>income</th>\n",
       "      <th>...</th>\n",
       "      <th>months_since_policy_inception</th>\n",
       "      <th>number_of_open_complaints</th>\n",
       "      <th>number_of_policies</th>\n",
       "      <th>policy_type</th>\n",
       "      <th>policy</th>\n",
       "      <th>renew_offer_type</th>\n",
       "      <th>sales_channel</th>\n",
       "      <th>total_claim_amount</th>\n",
       "      <th>vehicle_class</th>\n",
       "      <th>vehicle_size</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>BU79786</td>\n",
       "      <td>Washington</td>\n",
       "      <td>2763.519279</td>\n",
       "      <td>No</td>\n",
       "      <td>Basic</td>\n",
       "      <td>Bachelor</td>\n",
       "      <td>8/24/11</td>\n",
       "      <td>Employed</td>\n",
       "      <td>F</td>\n",
       "      <td>56274</td>\n",
       "      <td>...</td>\n",
       "      <td>5</td>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>Corporate Auto</td>\n",
       "      <td>Corporate L3</td>\n",
       "      <td>Offer1</td>\n",
       "      <td>Agent</td>\n",
       "      <td>384.811147</td>\n",
       "      <td>Two-Door Car</td>\n",
       "      <td>Medsize</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>QZ44356</td>\n",
       "      <td>Arizona</td>\n",
       "      <td>6979.535903</td>\n",
       "      <td>No</td>\n",
       "      <td>Extended</td>\n",
       "      <td>Bachelor</td>\n",
       "      <td>12/31/11</td>\n",
       "      <td>Unemployed</td>\n",
       "      <td>F</td>\n",
       "      <td>0</td>\n",
       "      <td>...</td>\n",
       "      <td>42</td>\n",
       "      <td>0</td>\n",
       "      <td>8</td>\n",
       "      <td>Personal Auto</td>\n",
       "      <td>Personal L3</td>\n",
       "      <td>Offer3</td>\n",
       "      <td>Agent</td>\n",
       "      <td>1131.464935</td>\n",
       "      <td>Four-Door Car</td>\n",
       "      <td>Medsize</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>AI49188</td>\n",
       "      <td>Nevada</td>\n",
       "      <td>12887.431650</td>\n",
       "      <td>No</td>\n",
       "      <td>Premium</td>\n",
       "      <td>Bachelor</td>\n",
       "      <td>7/19/11</td>\n",
       "      <td>Employed</td>\n",
       "      <td>F</td>\n",
       "      <td>48767</td>\n",
       "      <td>...</td>\n",
       "      <td>38</td>\n",
       "      <td>0</td>\n",
       "      <td>2</td>\n",
       "      <td>Personal Auto</td>\n",
       "      <td>Personal L3</td>\n",
       "      <td>Offer1</td>\n",
       "      <td>Agent</td>\n",
       "      <td>566.472247</td>\n",
       "      <td>Two-Door Car</td>\n",
       "      <td>Medsize</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>WW63253</td>\n",
       "      <td>California</td>\n",
       "      <td>7645.861827</td>\n",
       "      <td>No</td>\n",
       "      <td>Basic</td>\n",
       "      <td>Bachelor</td>\n",
       "      <td>7/20/11</td>\n",
       "      <td>Unemployed</td>\n",
       "      <td>M</td>\n",
       "      <td>0</td>\n",
       "      <td>...</td>\n",
       "      <td>65</td>\n",
       "      <td>0</td>\n",
       "      <td>7</td>\n",
       "      <td>Corporate Auto</td>\n",
       "      <td>Corporate L2</td>\n",
       "      <td>Offer1</td>\n",
       "      <td>Call Center</td>\n",
       "      <td>529.881344</td>\n",
       "      <td>SUV</td>\n",
       "      <td>Medsize</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>HB64268</td>\n",
       "      <td>Washington</td>\n",
       "      <td>2813.692575</td>\n",
       "      <td>No</td>\n",
       "      <td>Basic</td>\n",
       "      <td>Bachelor</td>\n",
       "      <td>11/3/11</td>\n",
       "      <td>Employed</td>\n",
       "      <td>M</td>\n",
       "      <td>43836</td>\n",
       "      <td>...</td>\n",
       "      <td>44</td>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>Personal Auto</td>\n",
       "      <td>Personal L1</td>\n",
       "      <td>Offer1</td>\n",
       "      <td>Agent</td>\n",
       "      <td>138.130879</td>\n",
       "      <td>Four-Door Car</td>\n",
       "      <td>Medsize</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "<p>5 rows × 24 columns</p>\n",
       "</div>"
      ],
      "text/plain": [
       "  customer       state  customer_lifetime_value response  coverage education  \\\n",
       "0  BU79786  Washington              2763.519279       No     Basic  Bachelor   \n",
       "1  QZ44356     Arizona              6979.535903       No  Extended  Bachelor   \n",
       "2  AI49188      Nevada             12887.431650       No   Premium  Bachelor   \n",
       "3  WW63253  California              7645.861827       No     Basic  Bachelor   \n",
       "4  HB64268  Washington              2813.692575       No     Basic  Bachelor   \n",
       "\n",
       "  effective_to_date employmentstatus gender  income  ...  \\\n",
       "0           8/24/11         Employed      F   56274  ...   \n",
       "1          12/31/11       Unemployed      F       0  ...   \n",
       "2           7/19/11         Employed      F   48767  ...   \n",
       "3           7/20/11       Unemployed      M       0  ...   \n",
       "4           11/3/11         Employed      M   43836  ...   \n",
       "\n",
       "  months_since_policy_inception number_of_open_complaints  number_of_policies  \\\n",
       "0                             5                         0                   1   \n",
       "1                            42                         0                   8   \n",
       "2                            38                         0                   2   \n",
       "3                            65                         0                   7   \n",
       "4                            44                         0                   1   \n",
       "\n",
       "      policy_type        policy  renew_offer_type  sales_channel  \\\n",
       "0  Corporate Auto  Corporate L3            Offer1          Agent   \n",
       "1   Personal Auto   Personal L3            Offer3          Agent   \n",
       "2   Personal Auto   Personal L3            Offer1          Agent   \n",
       "3  Corporate Auto  Corporate L2            Offer1    Call Center   \n",
       "4   Personal Auto   Personal L1            Offer1          Agent   \n",
       "\n",
       "  total_claim_amount  vehicle_class vehicle_size  \n",
       "0         384.811147   Two-Door Car      Medsize  \n",
       "1        1131.464935  Four-Door Car      Medsize  \n",
       "2         566.472247   Two-Door Car      Medsize  \n",
       "3         529.881344            SUV      Medsize  \n",
       "4         138.130879  Four-Door Car      Medsize  \n",
       "\n",
       "[5 rows x 24 columns]"
      ]
     },
     "execution_count": 11,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "file1.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "metadata": {},
   "outputs": [],
   "source": [
    "#this code gets rid of any rows that are exact duplicates (across all columns)\n",
    "file1 = file1.drop_duplicates()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(9134, 24)"
      ]
     },
     "execution_count": 13,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "file1.shape"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "#### I want to change zeros in income into the mean value of incomeso they don't distort the data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "0       56274\n",
       "1           0\n",
       "2       48767\n",
       "3           0\n",
       "4       43836\n",
       "        ...  \n",
       "9129    71941\n",
       "9130    21604\n",
       "9131        0\n",
       "9132    21941\n",
       "9133        0\n",
       "Name: income, Length: 9134, dtype: int64"
      ]
     },
     "execution_count": 14,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "file1['income']"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "metadata": {},
   "outputs": [],
   "source": [
    "###Attempt to replace all '0's with 'NA' in income (note when we used the mean - looked bad in histogram becuase there are a lot of 0s)\n",
    "#file1['income'] = file1['income'].replace(0, 'NA')\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "0        2317\n",
       "95697      12\n",
       "40864       7\n",
       "24910       7\n",
       "25965       7\n",
       "         ... \n",
       "26952       1\n",
       "84300       1\n",
       "22862       1\n",
       "20815       1\n",
       "57240       1\n",
       "Name: income, Length: 5694, dtype: int64"
      ]
     },
     "execution_count": 16,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "\n",
    "\n",
    "file1['income'].value_counts(0)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Changing data type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "metadata": {
    "scrolled": false
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "<class 'pandas.core.frame.DataFrame'>\n",
      "Int64Index: 9134 entries, 0 to 9133\n",
      "Data columns (total 24 columns):\n",
      " #   Column                         Non-Null Count  Dtype  \n",
      "---  ------                         --------------  -----  \n",
      " 0   customer                       9134 non-null   object \n",
      " 1   state                          9134 non-null   object \n",
      " 2   customer_lifetime_value        9134 non-null   float64\n",
      " 3   response                       9134 non-null   object \n",
      " 4   coverage                       9134 non-null   object \n",
      " 5   education                      9134 non-null   object \n",
      " 6   effective_to_date              9134 non-null   object \n",
      " 7   employmentstatus               9134 non-null   object \n",
      " 8   gender                         9134 non-null   object \n",
      " 9   income                         9134 non-null   int64  \n",
      " 10  location_code                  9134 non-null   object \n",
      " 11  marital_status                 9134 non-null   object \n",
      " 12  monthly_premium_auto           9134 non-null   int64  \n",
      " 13  months_since_last_claim        9134 non-null   int64  \n",
      " 14  months_since_policy_inception  9134 non-null   int64  \n",
      " 15  number_of_open_complaints      9134 non-null   int64  \n",
      " 16  number_of_policies             9134 non-null   int64  \n",
      " 17  policy_type                    9134 non-null   object \n",
      " 18  policy                         9134 non-null   object \n",
      " 19  renew_offer_type               9134 non-null   object \n",
      " 20  sales_channel                  9134 non-null   object \n",
      " 21  total_claim_amount             9134 non-null   float64\n",
      " 22  vehicle_class                  9134 non-null   object \n",
      " 23  vehicle_size                   9134 non-null   object \n",
      "dtypes: float64(2), int64(6), object(16)\n",
      "memory usage: 1.7+ MB\n"
     ]
    }
   ],
   "source": [
    "file1.info()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Analysing the Data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "metadata": {
    "scrolled": true
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>customer_lifetime_value</th>\n",
       "      <th>income</th>\n",
       "      <th>monthly_premium_auto</th>\n",
       "      <th>months_since_last_claim</th>\n",
       "      <th>months_since_policy_inception</th>\n",
       "      <th>number_of_open_complaints</th>\n",
       "      <th>number_of_policies</th>\n",
       "      <th>total_claim_amount</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>count</th>\n",
       "      <td>9134.000000</td>\n",
       "      <td>9134.000000</td>\n",
       "      <td>9134.000000</td>\n",
       "      <td>9134.000000</td>\n",
       "      <td>9134.000000</td>\n",
       "      <td>9134.000000</td>\n",
       "      <td>9134.000000</td>\n",
       "      <td>9134.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>mean</th>\n",
       "      <td>8004.940475</td>\n",
       "      <td>37657.380009</td>\n",
       "      <td>93.219291</td>\n",
       "      <td>15.097000</td>\n",
       "      <td>48.064594</td>\n",
       "      <td>0.384388</td>\n",
       "      <td>2.966170</td>\n",
       "      <td>434.088794</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>std</th>\n",
       "      <td>6870.967608</td>\n",
       "      <td>30379.904734</td>\n",
       "      <td>34.407967</td>\n",
       "      <td>10.073257</td>\n",
       "      <td>27.905991</td>\n",
       "      <td>0.910384</td>\n",
       "      <td>2.390182</td>\n",
       "      <td>290.500092</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>min</th>\n",
       "      <td>1898.007675</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>61.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>0.099007</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>25%</th>\n",
       "      <td>3994.251794</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>68.000000</td>\n",
       "      <td>6.000000</td>\n",
       "      <td>24.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>272.258244</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>50%</th>\n",
       "      <td>5780.182197</td>\n",
       "      <td>33889.500000</td>\n",
       "      <td>83.000000</td>\n",
       "      <td>14.000000</td>\n",
       "      <td>48.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>2.000000</td>\n",
       "      <td>383.945434</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>75%</th>\n",
       "      <td>8962.167041</td>\n",
       "      <td>62320.000000</td>\n",
       "      <td>109.000000</td>\n",
       "      <td>23.000000</td>\n",
       "      <td>71.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>4.000000</td>\n",
       "      <td>547.514839</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>max</th>\n",
       "      <td>83325.381190</td>\n",
       "      <td>99981.000000</td>\n",
       "      <td>298.000000</td>\n",
       "      <td>35.000000</td>\n",
       "      <td>99.000000</td>\n",
       "      <td>5.000000</td>\n",
       "      <td>9.000000</td>\n",
       "      <td>2893.239678</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "       customer_lifetime_value        income  monthly_premium_auto  \\\n",
       "count              9134.000000   9134.000000           9134.000000   \n",
       "mean               8004.940475  37657.380009             93.219291   \n",
       "std                6870.967608  30379.904734             34.407967   \n",
       "min                1898.007675      0.000000             61.000000   \n",
       "25%                3994.251794      0.000000             68.000000   \n",
       "50%                5780.182197  33889.500000             83.000000   \n",
       "75%                8962.167041  62320.000000            109.000000   \n",
       "max               83325.381190  99981.000000            298.000000   \n",
       "\n",
       "       months_since_last_claim  months_since_policy_inception  \\\n",
       "count              9134.000000                    9134.000000   \n",
       "mean                 15.097000                      48.064594   \n",
       "std                  10.073257                      27.905991   \n",
       "min                   0.000000                       0.000000   \n",
       "25%                   6.000000                      24.000000   \n",
       "50%                  14.000000                      48.000000   \n",
       "75%                  23.000000                      71.000000   \n",
       "max                  35.000000                      99.000000   \n",
       "\n",
       "       number_of_open_complaints  number_of_policies  total_claim_amount  \n",
       "count                9134.000000         9134.000000         9134.000000  \n",
       "mean                    0.384388            2.966170          434.088794  \n",
       "std                     0.910384            2.390182          290.500092  \n",
       "min                     0.000000            1.000000            0.099007  \n",
       "25%                     0.000000            1.000000          272.258244  \n",
       "50%                     0.000000            2.000000          383.945434  \n",
       "75%                     0.000000            4.000000          547.514839  \n",
       "max                     5.000000            9.000000         2893.239678  "
      ]
     },
     "execution_count": 18,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "file1.describe()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>count</th>\n",
       "      <th>mean</th>\n",
       "      <th>std</th>\n",
       "      <th>min</th>\n",
       "      <th>25%</th>\n",
       "      <th>50%</th>\n",
       "      <th>75%</th>\n",
       "      <th>max</th>\n",
       "      <th>iqr</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>customer_lifetime_value</th>\n",
       "      <td>9134.0</td>\n",
       "      <td>8004.940475</td>\n",
       "      <td>6870.967608</td>\n",
       "      <td>1898.007675</td>\n",
       "      <td>3994.251794</td>\n",
       "      <td>5780.182197</td>\n",
       "      <td>8962.167041</td>\n",
       "      <td>83325.381190</td>\n",
       "      <td>4967.915247</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>income</th>\n",
       "      <td>9134.0</td>\n",
       "      <td>37657.380009</td>\n",
       "      <td>30379.904734</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>33889.500000</td>\n",
       "      <td>62320.000000</td>\n",
       "      <td>99981.000000</td>\n",
       "      <td>62320.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>monthly_premium_auto</th>\n",
       "      <td>9134.0</td>\n",
       "      <td>93.219291</td>\n",
       "      <td>34.407967</td>\n",
       "      <td>61.000000</td>\n",
       "      <td>68.000000</td>\n",
       "      <td>83.000000</td>\n",
       "      <td>109.000000</td>\n",
       "      <td>298.000000</td>\n",
       "      <td>41.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>months_since_last_claim</th>\n",
       "      <td>9134.0</td>\n",
       "      <td>15.097000</td>\n",
       "      <td>10.073257</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>6.000000</td>\n",
       "      <td>14.000000</td>\n",
       "      <td>23.000000</td>\n",
       "      <td>35.000000</td>\n",
       "      <td>17.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>months_since_policy_inception</th>\n",
       "      <td>9134.0</td>\n",
       "      <td>48.064594</td>\n",
       "      <td>27.905991</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>24.000000</td>\n",
       "      <td>48.000000</td>\n",
       "      <td>71.000000</td>\n",
       "      <td>99.000000</td>\n",
       "      <td>47.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>number_of_open_complaints</th>\n",
       "      <td>9134.0</td>\n",
       "      <td>0.384388</td>\n",
       "      <td>0.910384</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>5.000000</td>\n",
       "      <td>0.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>number_of_policies</th>\n",
       "      <td>9134.0</td>\n",
       "      <td>2.966170</td>\n",
       "      <td>2.390182</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>2.000000</td>\n",
       "      <td>4.000000</td>\n",
       "      <td>9.000000</td>\n",
       "      <td>3.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>total_claim_amount</th>\n",
       "      <td>9134.0</td>\n",
       "      <td>434.088794</td>\n",
       "      <td>290.500092</td>\n",
       "      <td>0.099007</td>\n",
       "      <td>272.258244</td>\n",
       "      <td>383.945434</td>\n",
       "      <td>547.514839</td>\n",
       "      <td>2893.239678</td>\n",
       "      <td>275.256594</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "                                count          mean           std  \\\n",
       "customer_lifetime_value        9134.0   8004.940475   6870.967608   \n",
       "income                         9134.0  37657.380009  30379.904734   \n",
       "monthly_premium_auto           9134.0     93.219291     34.407967   \n",
       "months_since_last_claim        9134.0     15.097000     10.073257   \n",
       "months_since_policy_inception  9134.0     48.064594     27.905991   \n",
       "number_of_open_complaints      9134.0      0.384388      0.910384   \n",
       "number_of_policies             9134.0      2.966170      2.390182   \n",
       "total_claim_amount             9134.0    434.088794    290.500092   \n",
       "\n",
       "                                       min          25%           50%  \\\n",
       "customer_lifetime_value        1898.007675  3994.251794   5780.182197   \n",
       "income                            0.000000     0.000000  33889.500000   \n",
       "monthly_premium_auto             61.000000    68.000000     83.000000   \n",
       "months_since_last_claim           0.000000     6.000000     14.000000   \n",
       "months_since_policy_inception     0.000000    24.000000     48.000000   \n",
       "number_of_open_complaints         0.000000     0.000000      0.000000   \n",
       "number_of_policies                1.000000     1.000000      2.000000   \n",
       "total_claim_amount                0.099007   272.258244    383.945434   \n",
       "\n",
       "                                        75%           max           iqr  \n",
       "customer_lifetime_value         8962.167041  83325.381190   4967.915247  \n",
       "income                         62320.000000  99981.000000  62320.000000  \n",
       "monthly_premium_auto             109.000000    298.000000     41.000000  \n",
       "months_since_last_claim           23.000000     35.000000     17.000000  \n",
       "months_since_policy_inception     71.000000     99.000000     47.000000  \n",
       "number_of_open_complaints          0.000000      5.000000      0.000000  \n",
       "number_of_policies                 4.000000      9.000000      3.000000  \n",
       "total_claim_amount               547.514839   2893.239678    275.256594  "
      ]
     },
     "execution_count": 19,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "#make a statistics summary df with transpose\n",
    "summary = file1.describe().T\n",
    "#calculate the interquartile range as a new column\n",
    "summary['iqr'] = summary['75%']-summary['25%']\n",
    "summary"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Charts. Plots"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "metadata": {},
   "outputs": [],
   "source": [
    "import matplotlib.pyplot as plt\n",
    "import seaborn as sns\n",
    "%matplotlib inline"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "plt.scatter(x=file1['monthly_premium_auto'], y=file1['customer_lifetime_value'])\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "file1['monthly_premium_auto'].hist(bins=20)\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "metadata": {
    "scrolled": true
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAAXcAAAD5CAYAAADcDXXiAAAAOXRFWHRTb2Z0d2FyZQBNYXRwbG90bGliIHZlcnNpb24zLjMuMiwgaHR0cHM6Ly9tYXRwbG90bGliLm9yZy8vihELAAAACXBIWXMAAAsTAAALEwEAmpwYAAAVVUlEQVR4nO3dfZBddZ3n8fcnoWkkgLRiulrITqwZpooHV1h7KVeXJQNTorNbEGuXKdgtRbEM7DCrbrm1A9bW6NQUW5naWS1rHa3BESfluHGyIoqgrgzQ48qIbIKMAaPCLDGTAAkyQRKIefzuH30aL+F29+10Ojd98n5V3Trn/u55+Hbn5tO/+7vnIVWFJKldFvS7AEnS4We4S1ILGe6S1EKGuyS1kOEuSS10XL8LADjttNNq6dKl/S5D6ur5559n0aJF/S5Depl169b9rKpe0+21oyLcly5dytq1a/tdhtTV2NgYy5Yt63cZ0ssk+elkrzksI0ktZLhLUgsZ7pLUQtOGe5ITkjyQ5G+TPJLkD5r2VyW5K8mjzXSoY50bkzyW5MdJLp3LH0CS9HK99Nx3AxdX1RuA84C3JXkTcANwd1WdCdzdPCfJ2cCVwDnA24BPJVk4B7VLkiYxbbjXuJ3N04HmUcDlwKqmfRWwvJm/HPhiVe2uqseBx4ALDmfR0pGwevVqzj33XC655BLOPfdcVq9e3e+SpJ71dChk0/NeB/wa8CdV9b0kw1X1JEBVPZlkcbP46cD9HatvbtqkeWP16tVcd9117Nq1iwMHDvCTn/yE6667DoCrrrqqz9VJ0+sp3KtqP3BeklOB25KcO8Xi6baJly2UrABWAAwPDzM2NtZLKdIRce2117Jz505OPfVUnn32WU466SSeffZZrr32WkZGRvpdnjStGZ3EVFXPJhljfCx9a5KRptc+AmxrFtsMLOlY7QzgiS7buhm4GWB0dLQ8SURHkx07dnD88cezc+dOqoqdO3cyMDDAjh07PKFJ80IvR8u8pumxk+QVwG8CPwJuB65uFrsa+GozfztwZZLBJK8DzgQeOMx1S3Nuz549rFy5km984xusXLmSPXv29LskqWe99NxHgFXNuPsCYE1V3ZHku8CaJO8FNgFXAFTVI0nWAD8E9gHXN8M60rxy4okncv7557N//37OP/98TjzxRF544YV+lyX1JEfDbfZGR0fLa8voaJKEJAwPD7Nt2zYWL17M1q1bqSqOhv8zEkCSdVU12u21o+LCYdLR5rjjxv9rPPXUUy9OJ9qk+cDLD0hdXHzxxezbt4+hoSGSMDQ0xL59+7j44ov7XZrUE8Nd6mLLli0sX76cF154garihRdeYPny5WzZsqXfpUk9MdylLjZs2PCy49lHRkbYsGFDnyqSZsYvVKUuXv3qV7N9+3YWLFjA/v37WbhwIQcOHGBoaIhnnnmm3+VJwNRfqNpzl7rYvn07VcUpp5wCwCmnnEJVsX379j5XJvXGcJe6mPhEOxHmE9Oj4ZOu1AvDXZrC0qVL+fznP483cNd8Y7hLU9i1axfvete72LVrV79LkWbEcJem8PTTT1NVPP300/0uRZoRw12awsKFC18yleYLw12awoEDB14yleYLw13q4pxzzgFg//79L5lOtEtHO8Nd6mLjxo0zapeONoa71MXzzz8PvHzMfaJdOtp5DVNpEqeccgpf+cpXXrz8wPLly3nuuef6XZbUE8NdmsRzzz3nJX41bzksI01hYGCAT3ziEwwMDPS7FGlG7LlLU9i7dy8f+MAH+l2GNGP23KUpTNxaz1vsab4x3KVJDA4OvuQ498HBwT5XJPXOcJcmsXv3bhYvXsznPvc5Fi9ezO7du/tdktQzP2tKXSRhYGCArVu38p73vAeA448/nr179/a5Mqk39tylLqqKkZER7rnnHu666y7uueceRkZGvFmH5g177lIXg4ODnHHGGbz97W9n9+7dDA4OMjo6ylNPPdXv0qSe2HOXurjooou47777uOaaa/ja177GNddcw3333cdFF13U79Kknthzl7rYsmULy5cv55ZbbuHTn/40g4ODLF++nEcffbTfpUk9MdylLjZs2MD3v/99BgYGGBsbY9myZezdu5cTTjih36VJPTHcpS7OOuss3vzmN7Nu3TqqiiS88Y1v5Kyzzup3aVJPHHOXuliwYAFr165l0aJFACxatIi1a9eyYIH/ZTQ/+E6Vuli/fj0DAwMvnri0e/duBgYGWL9+fZ8rk3pjuEuTSPLiSUt79+4lSZ8rknpnuEuT2LNnD0NDQyxYsIChoSH27NnT75Kknk0b7kmWJLk3yYYkjyT5QNP+0SRbkjzUPH6rY50bkzyW5MdJLp3LH0CaSxdeeCG33norF154Yb9LkWYk051OnWQEGKmqB5OcDKwDlgO/Deysqj8+aPmzgdXABcBrgb8Cfr2q9k+2j9HR0Vq7du1sfg7psJpqCMZLEOhokWRdVY12e23anntVPVlVDzbzO4ANwOlTrHI58MWq2l1VjwOPMR700rwzEfKOt2u+mdFx7kmWAucD3wPeAvxukncBa4EPVdV2xoP//o7VNtPlj0GSFcAKgOHhYcbGxg6hfGluTfTSO3vrvlc1H0w7LPPigslJwF8DN1XVl5MMAz8DCvhDxodurknyJ8B3q+ovmvU+C3y9qm6dbNsOy+ho47CM5oNZDcs0GxgAbgW+UFVfBqiqrVW1v6oOAJ/hl0Mvm4ElHaufATxxqMVLkmaul6NlAnwW2FBVH+toH+lY7B3Aw8387cCVSQaTvA44E3jg8JUsHTlDQ0N85jOfYWhoqN+lSDPSy5j7W4B3AuuTPNS0fRi4Ksl5jA/LbASuBaiqR5KsAX4I7AOun+pIGelotn37dt73vvf1uwxpxqYN96r6DtBtAPLrU6xzE3DTLOqSjgonnHACv/jFL16cSvOFZ6hKU5gIdINd843hLkktZLhLUgsZ7tIULrvsMm677TYuu+yyfpcizUjPJzHNJU9i0tHGk5g0H8z6JCZJ0vxiuEtSCxnuktRChrs0iYPH3b3sr+YTw12axMFfnPpFquYTw12SWshwl6QWMtwlqYUMd2kKJ598MgsWLODkk0/udynSjMzoHqrSsWbHjh0vmUrzhT13SWohw12SWshwl6QWMtwlqYUMd0lqIcNdklrIcJekFjLcJamFDHdJaiHDXZJayHCXpBYy3CWphQx3SWohw12SWshwl6QWMtwlqYUMd0lqIcNdklpo2nBPsiTJvUk2JHkkyQea9lcluSvJo810qGOdG5M8luTHSS6dyx9AkvRyvfTc9wEfqqqzgDcB1yc5G7gBuLuqzgTubp7TvHYlcA7wNuBTSRbORfGSpO6mDfeqerKqHmzmdwAbgNOBy4FVzWKrgOXN/OXAF6tqd1U9DjwGXHCY65YkTeG4mSycZClwPvA9YLiqnoTxPwBJFjeLnQ7c37Ha5qbt4G2tAFYADA8PMzY2NtPapb7wvar5oOdwT3IScCvwwap6Lsmki3Zpq5c1VN0M3AwwOjpay5Yt67UUqa98r2o+6OlomSQDjAf7F6rqy03z1iQjzesjwLamfTOwpGP1M4AnDk+5kqRe9HK0TIDPAhuq6mMdL90OXN3MXw18taP9yiSDSV4HnAk8cPhKliRNp5dhmbcA7wTWJ3moafswsBJYk+S9wCbgCoCqeiTJGuCHjB9pc31V7T/chUuSJjdtuFfVd+g+jg5wySTr3ATcNIu6JEmz4BmqktRChrsktZDhLkktZLhLUgsZ7pLUQoa7JLWQ4S5JLWS4S1ILGe6S1EKGuyS1kOEuSS1kuEtSCxnuktRChrsktZDhLkktZLhLUgsZ7pLUQoa7NIUFCxa8ZCrNF75jpSkcOHDgJVNpvujlBtlSayST3Q748G6jqma9H2k27LnrmFJVPT2WLFnSdf0lS5b0tL7Ub4a71MWmTZteFvBLlixh06ZNfapImhnDXZrEpk2bqCp+5ffuoKoMds0rhrsktZDhLkktZLhLUgsZ7pLUQoa7JLWQ4S5JLWS4S1ILGe6S1EKGuyS1kOEuSS00bbgnuSXJtiQPd7R9NMmWJA81j9/qeO3GJI8l+XGSS+eqcEnS5Hrpuf858LYu7R+vqvOax9cBkpwNXAmc06zzqSQLD1exkqTeTBvuVfVt4B963N7lwBerandVPQ48Blwwi/okSYdgNjfr+N0k7wLWAh+qqu3A6cD9HctsbtpeJskKYAXA8PAwY2NjsyhFmlu+PzXfHGq4fxr4Q6Ca6X8HrgG63aKm650Lqupm4GaA0dHRWrZs2SGWIs2xb96J70/NN4d0tExVba2q/VV1APgMvxx62Qx03uHgDOCJ2ZUoSZqpQwr3JCMdT98BTBxJcztwZZLBJK8DzgQemF2JkqSZmnZYJslqYBlwWpLNwEeAZUnOY3zIZSNwLUBVPZJkDfBDYB9wfVXtn5PKJUmTmjbcq+qqLs2fnWL5m4CbZlOUJGl2PENVklrIcJekFjLcJamFDHdJaiHDXZJayHCXpBYy3CWphQx3SWohw12SWshwl6QWMtwlqYUMd0lqIcNdklrIcJekFjLcJamFDHdJaiHDXZJayHCXpBYy3CWphQx3SWohw12SWshwl6QWMtwlqYUMd0lqIcNdklrIcJekFjLcJamFDHdJaqHj+l2ANBtv+INv8fNde+d8P0tvuHNOt//KVwzwtx9565zuQ8cWw13z2s937WXjyn85p/sYGxtj2bJlc7qPuf7joWOPwzKS1EKGuyS10LThnuSWJNuSPNzR9qokdyV5tJkOdbx2Y5LHkvw4yaVzVbgkaXK99Nz/HHjbQW03AHdX1ZnA3c1zkpwNXAmc06zzqSQLD1u1kqSeTBvuVfVt4B8Oar4cWNXMrwKWd7R/sap2V9XjwGPABYenVElSrw71aJnhqnoSoKqeTLK4aT8duL9juc1N28skWQGsABgeHmZsbOwQS9Gxbq7fOzt37jwi70//D+hwOtyHQqZLW3VbsKpuBm4GGB0drbk+1Ewt9c075/wwxSNxKOSR+Dl0bDnUo2W2JhkBaKbbmvbNwJKO5c4Anjj08iRJh+JQw/124Opm/mrgqx3tVyYZTPI64EzggdmVKEmaqWmHZZKsBpYBpyXZDHwEWAmsSfJeYBNwBUBVPZJkDfBDYB9wfVXtn6PaJUmTmDbcq+qqSV66ZJLlbwJumk1RkqTZ8QxVSWohw12SWshwl6QWMtwlqYUMd0lqIcNdklrIcJekFjLcJamFDHdJaiFvkK157eSzbuD1q26Y+x2tmn6R2Tj5LIC5vdG3ji2Gu+a1HRtWsnHl3Ibikbjk79Ib7pzT7evY47CMJLWQ4S5JLWS4S1ILGe6S1EKGuyS1kOEuSS1kuEtSCxnuktRChrsktZDhLkkt5OUHNO8dkVP3vzm3+3jlKwbmdPs69hjumtfm+royMP7H40jsRzqcHJaRpBYy3CWphQx3SWohw12SWsgvVHVMSXJo6/3RzJavqkPaj3S42HPXMaWqZvy49957Z7yO1G+GuyS1kOEuSS1kuEtSCxnuktRCszpaJslGYAewH9hXVaNJXgX8JbAU2Aj8dlVtn12ZkqSZOBw999+oqvOqarR5fgNwd1WdCdzdPJckHUFzMSxzObCqmV8FLJ+DfUiSpjDbk5gK+FaSAv60qm4GhqvqSYCqejLJ4m4rJlkBrAAYHh5mbGxslqVIc2Pnzp2+PzXvZDYnXCR5bVU90QT4XcB/AG6vqlM7ltleVUPTbOdp4KeHXIg0t04DftbvIqQufqWqXtPthVn13KvqiWa6LcltwAXA1iQjTa99BNjWw3a6FicdDZKs7fhOSZoXDnnMPcmiJCdPzANvBR4Gbgeubha7GvjqbIuUJM3MbHruw8BtzYWYjgP+Z1V9M8n/BdYkeS+wCbhi9mVKkmZiVmPu0rEgyYrmYAFp3jDcJamFvPyAJLWQ4S5JLWS4S1ILGe46qiQ5NcnvdDxfluSOSZYdS3JUHn+e5LVJvtTvOjol+WCSE/tdh44Mw11Hm1OB35luobmWZOFs1q+qJ6rq3xyueg6TDwKG+zHCcNchS7I0yY+S/FmSh5N8IclvJrkvyaNJLkjyqiRfSfKDJPcn+cfNuh9NckvT+/5/Sd7fbHYl8KtJHkry35q2k5J8qdnXF3LQXa6TvDfJxzuevy/Jx6apeVVT05cmerNJNib5/STfAa5I8tYk303yYJL/leSkjuX+a/Pa2iT/JMn/TvJ3Sa7r2M/Dzfy7k3yyo4Y7kixr5ncm+aMk65L8VfM7m/idXDbN7/7/NLU9mOTNTftLPukk+WSz//cDrwXuTXJv89pVSdY3/3YzvAW4jnqHcsNgHz6qCsav2b8PeD3jHYV1wC1AGL866FeA/wF8pFn+YuChZv6jwN8Ag4xfu+UZYKDZ5sMd+1gG/Bw4o9nHd4F/3rw2BowCi4C/Awaa9r8BXj9FzQW8pXl+C/CfmvmNwH9u5k8Dvg0sap7/HvD7Hcv9+2b+48APgJOB1wDbOvbzcDP/buCTHTXcASxr5gt4ezN/G/Ct5vfwhonf1SQ/x4nACc38mcDajt/XHR3LfRJ4d0fdpzXzr2X8JMPXMH4S4j3A8n6/p3wcvsdsrwopPV5V6wGSPML4tfwryXrGA+5XgH8NUFX3JHl1klc2695ZVbuB3Um2MX7WczcPVNXmZh8PNdv9zsSLVfV8knuAf5VkA+Mhv36Kmv++qu5r5v8CeD/wx83zv2ymbwLOBu5rPigcz/gflgm3N9P1wElVtQPYkeQXSU6dYt8H2wN8s2Nbu6tqb8fvbzIDwCeTnMf4zXJ+fQb7BPinwFhVPQ2Q5AvAv2D8D7JawHDXbO3umD/Q8fwA4++vfV3WmThzrnPd/Uz+fuxluT8DPgz8CPjc1CW/uP9uz59vpgHuqqqrpqmp82eeeH5wfft46RDoCR3ze6tqYv8vbquqDiSZ6v/nfwS2Mt7DXwD8ood9dcok7WoJx9w1174N/DsYHw8GflZVz02x/A7GhzhmpKq+BywB/i2weprF/1GSf9bMX0XHp4AO9wNvSfJrAElOTDLT3vGEjcB5SRYkWcL41VNn65XAk1V1AHgnMPEF8E+Bs5MMNp+QLulYp/N3+z3goiSnNV8eXwX89WGoS0cJe+6aax8FPpfkB8AL/PKKoV1V1TPNF7IPA98A7pzBvtYA59X09+zdAFyd5E+BR4FPd6nj6STvBlYnGWya/wvwkxnUM+E+4HHGh10eBh48hG0c7FPArUmuAO6l+cRRVX+fZA3j3wM8Cny/Y52bgW8kebKqfiPJjc26Ab5eVV7BtUW8toxaozlK5ONVdfcUyyxl/AvHc49YYVIfOCyjeS/jJz79BNg1VbBLxxJ77mqlJK8GugX9JVX1zJGu51AluRQ4+Bj0x6vqHf2oR/OH4S5JLeSwjCS1kOEuSS1kuEtSCxnuktRC/x+bpN7RsaLGuQAAAABJRU5ErkJggg==\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "file1[['monthly_premium_auto']].boxplot()\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#The majority of people have one or two policies\n",
    "file1['number_of_policies'].hist()\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#There is little change in the months since last claim by number of policies. \n",
    "sns.boxplot(x = 'number_of_policies',y = 'months_since_last_claim', data=file1)\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "vwo=file1['customer_lifetime_value']>20000\n",
    "file1['customer_lifetime_value'].hist(bins=100)\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "metadata": {
    "scrolled": true
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "file1[['customer_lifetime_value']].boxplot()\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "metadata": {
    "scrolled": true
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "0        2763.519279\n",
       "1        6979.535903\n",
       "2       12887.431650\n",
       "3        7645.861827\n",
       "4        2813.692575\n",
       "            ...     \n",
       "9129    23405.987980\n",
       "9130     3096.511217\n",
       "9131     8163.890428\n",
       "9132     7524.442436\n",
       "9133     2611.836866\n",
       "Name: customer_lifetime_value, Length: 9134, dtype: float64"
      ]
     },
     "execution_count": 28,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "file1['customer_lifetime_value']"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### Correlation"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "plt.scatter(x=file1['customer_lifetime_value'], y=file1['income'])\n",
    "plt.show()"
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
