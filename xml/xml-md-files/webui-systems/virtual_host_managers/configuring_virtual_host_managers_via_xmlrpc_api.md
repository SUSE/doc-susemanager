### Configuring Virtual Host Managers via XMLRPC API {#configuring-virtual-host-managers-via-xmlrpc-api}

The following APIs allow you to get a list of available **virtual-host-manager** modules and the parameters they require:

*   ```
    virtualhostmanager.listAvailableVirtualHostGathererModules(session)

    ```

*   ```
    virtualhostmanager.getModuleParameters(session, moduleName)

    ```

The following APIs allow you to create and delete VHMs. The module parameter map must match the map returned by `virtualhostmanager.getModuleParameters` to work correctly:

*   ```
    virtualhostmanager.create(session, label, moduleName, parameters)
    ```

*   ```
    virtualhostmanager.delete(session, label)
    ```

The following APIs return information about configured VHMs:

*   ```
    virtualhostmanager.listVirtualHostManagers(session)
    ```

*   ```
    virtualhostmanager.getDetail(session, label)
    ```