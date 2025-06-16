import pandas as pd
import unicodedata
import os

os.chdir('C:/Database/data/full_pitch/') # set proper wd
df = pd.read_csv('full_pitch_cols.csv')
df_keep = df[['game_date','pitch_type', 'pitch_name', 'player_name', 'pitcher', 'batter', 'description', 'zone', 'estimated_woba_using_speedangle', 'stand', 'p_throws', 'type', 'balls', 'strikes',
              'plate_x','plate_z', 'release_speed', 'sz_top', 'sz_bot', 'release_extension', 'arm_angle', 'release_spin_rate', 'n_thruorder_pitcher', 'bat_speed', 'swing_length', 'swing_path_tilt', 'attack_angle', 'intercept_ball_minus_batter_pos_y_inches',
              'intercept_ball_minus_batter_pos_x_inches', 'attack_direction']]
df_keep = df_keep[df_keep['pitch_type'].notna()]

df_keep = df_keep.rename(columns={'estimated_woba_using_speedangle': 'xwoba', 'stand': 'b_stands', 'plate_x': 'plate_horz', 'plate_z': 'plate_vert'})
batter = pd.read_csv('fg_00_24.csv')

batter = batter[['Name', 'MLBAMID']]
batter = batter.reset_index()
batter = batter.drop(columns=['index'])

df_keep = df_keep.merge(batter, how='left',left_on='batter', right_on='MLBAMID')
df_keep = df_keep.drop_duplicates()

cols = list(df_keep.columns)
cols.remove('Name')
cols.remove('pitcher')
cols.remove('batter')
cols.remove('MLBAMID')
cols = cols[:3] + ['Name'] + cols[3:]
df_keep = df_keep[cols]
df_keep = df_keep.rename(columns={'player_name': 'pitcher', 'Name':'batter'})

def clean_names(df, name_col):
    df = df.copy()
    df[name_col] = df[name_col].str.lower().str.strip()
    
    df[name_col] = df[name_col].apply(lambda x: ''.join(
        c for c in unicodedata.normalize('NFKD', str(x))
        if not unicodedata.combining(c)
    ))
    df[name_col] = df[name_col].str.replace(r'[^a-z ]', '', regex=True).str.replace(r'\s+', ' ', regex=True)
    
    return df

df_keep['pitcher'] = df_keep['pitcher'].str.split(', ').str[::-1].str.join(' ')
df_keep = clean_names(df_keep, 'pitcher')
df_keep = clean_names(df_keep, 'batter')
df_keep.to_csv('pitch_18_24.csv', index = False)