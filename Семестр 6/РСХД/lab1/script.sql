\echo 'Введите текущего пользователя: '
\prompt '' current_user_name

\set curr_user '\'' :current_user_name '\''

\echo 'Введите имя пользователя, кому нужно выдать права доступа: '
\prompt 'Введите имя пользователя, кому нужно выдать права доступа: ' target_user_name

\set to_user '\'' :target_user_name '\''

CALL get_tables(:curr_user::text, :to_user::text);