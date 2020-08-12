package main

import (
	"bufio"
	"log"
	"os"
	"strings"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		// SETUP - PARSE INPUT
		// ------------------

		// Parse the data from a line. Each line represents a single query along with the data to query.
		permissionsByDomain := make(map[string][]string)
		lineSegments := strings.Split(scanner.Text(), "|")

		// Parse the permissions that are requested
		requestedPermissions := strings.Split(lineSegments[0], ",")

		// Parse permissions for each domain - permissionsByDomain is a map of domain id's to permissions
		for _, domainSegment := range lineSegments[1:] {
			domainData := strings.Split(domainSegment, ",")
			domainID := domainData[0]
			domainPermissions := domainData[1:]
			permissionsByDomain[domainID] = domainPermissions
		}

		// WORK
		// ----
		// now do the work of building the filtered map

		// Naive triple loop implementation
		filteredPermissions := make(map[string][]string)
		for domainID, permissions := range permissionsByDomain {
			for _, permission := range permissions {
				found := false
				for _, requestedPermission := range requestedPermissions {
					if requestedPermission == permission {
						found = true
						break
					}
				}
				if found == true {
					filteredPermissions[domainID] = append(filteredPermissions[domainID], permission)
				}
			}
		}

		// Implementation with intermediate map lookup
		// filteredPermissions := make(map[string][]string)
		// sortedPermissions := make(map[string][]string)
		// for domainID, basePermissions := range permissionsByDomain {
		// 	for _, basePermission := range basePermissions {
		// 		sortedPermissions[basePermission] = append(sortedPermissions[basePermission], domainID)
		// 	}
		// }
		// for _, requestedPermission := range requestedPermissions {
		// 	if len(sortedPermissions[requestedPermission]) != 0 {
		// 		for _, domainID := range sortedPermissions[requestedPermission] {
		// 			filteredPermissions[domainID] = append(filteredPermissions[domainID], requestedPermission)
		// 		}
		// 	}
		// }
	}

	if err := scanner.Err(); err != nil {
		log.Println(err)
	}
}
