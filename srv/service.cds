using {taskmanager as tm} from '../db/schema';

service TaskService {
    @odata.draft.enabled
    entity Tasks       as projection on tm.Tasks;
    entity StatusCodes as projection on tm.StatusCodes;
    entity RequestTypes as projection on tm.RequestType;
};