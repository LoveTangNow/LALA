//
//  IndexRequestHandler.swift
//  LALAspot
//
//  Created by Thomas Liu on 16/9/11.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import CoreSpotlight

class IndexRequestHandler: CSIndexExtensionRequestHandler {

    override func searchableIndex(searchableIndex: CSSearchableIndex, reindexAllSearchableItemsWithAcknowledgementHandler acknowledgementHandler: () -> Void) {
        // Reindex all data with the provided index
        
        acknowledgementHandler()
    }

    override func searchableIndex(searchableIndex: CSSearchableIndex, reindexSearchableItemsWithIdentifiers identifiers: [String], acknowledgementHandler: () -> Void) {
        // Reindex any items with the given identifiers and the provided index
        
        acknowledgementHandler()
    }

}
