namespace taskmanager;
using {
    sap.common.CodeList,
    
} from '@sap/cds/common';

entity Tasks{
    key taskNumber            : String  @assert.unique;
    requestType           : Association to RequestType;
    requestNumber: String;
    description           : String;
    assignedTo            : String;
    status                : Association to StatusCodes;
    openedBy              : String;
    assignedDate          : Date;
    closedDate            : Date;
    comments              : String;
}

entity StatusCodes : CodeList {
    key code : String enum {
            Open    = 'O';
            Closed = 'C';
            In_Progress  = 'IP';
            OnHold    = 'OH';
        };
}

entity RequestType : CodeList {
    key code : String enum {
            ChangeRequestNumber   = 'CHG';
            IncidentNumber = 'INC';
        };
}
